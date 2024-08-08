import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_customer/src/models/data/address_data.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location;
import 'package:osm_nominatim/osm_nominatim.dart';
import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/handlers/handlers.dart';
import '../../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/address_repository.dart';
import '../state/add_address_state.dart';
import '../../../../../../../models/models.dart' as models;

class AddAddressNotifier extends StateNotifier<AddAddressState> {
  Timer? _timer;
  final AddressRepository _addressRepository;

  AddAddressNotifier(
    this._addressRepository,
  ) : super(
          AddAddressState(textController: TextEditingController()),
        );

  void setQuery(BuildContext context) {
    if (state.textController?.text.trim().isNotEmpty ?? false) {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          searchLocations(context);
        },
      );
    }
  }

  Future<void> searchLocations(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isSearching: true);
      final result = await Nominatim.searchByName(
        query: state.textController?.text.trim() ?? '',
        limit: 5,
        addressDetails: true,
        extraTags: true,
        nameDetails: true,
      );
      state = state.copyWith(
        searchedLocations: result,
        isSearching: false,
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  void clearSearchField() {
    state.textController?.clear();
    state = state.copyWith(searchedLocations: []);
  }

  void setMapController(GoogleMapController controller) {
    state = state.copyWith(mapController: controller);
  }

  void setChoosing(bool value) {
    state = state.copyWith(isChoosing: value);
  }

  void goToLocation({required Place place}) {
    state = state.copyWith(isSearching: false, searchedLocations: []);
    state.textController?.text = place.displayName;
    state.mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(place.lat, place.lon),
          tilt: 0,
          zoom: 17,
        ),
      ),
    );
    state = state.copyWith(
      isLoading: false,
      location: models.LocalLocation(
        latitude: place.lat,
        longitude: place.lon,
      ),
    );
  }

  Future<void> goToMyLocation(
    BuildContext context,
    location.LocationData locationData,
  ) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      final newPosition = LatLng(
        locationData.latitude ??
            (AppHelpers.getInitialLatitude() ?? AppConstants.demoLatitude),
        locationData.longitude ??
            (AppHelpers.getInitialLongitude() ?? AppConstants.demoLongitude),
      );
      state = state.copyWith(isLoading: true, searchedLocations: []);
      try {
        final List<Placemark> placemarks = await placemarkFromCoordinates(
          newPosition.latitude,
          newPosition.longitude,
          localeIdentifier: 'en',
        );

        if (placemarks.isNotEmpty) {
          final Placemark pos = placemarks[0];

          final List<String> addressData = [];
          addressData.add(pos.locality!);
          if (pos.subLocality != null && pos.subLocality!.isNotEmpty) {
            addressData.add(pos.subLocality!);
          }
          if (pos.thoroughfare != null && pos.thoroughfare!.isNotEmpty) {
            addressData.add(pos.thoroughfare!);
          }
          addressData.add(pos.name!);
          final String placeName = addressData.join(', ');
          state.textController?.text = placeName;
        }
      } catch (e) {
        state.textController?.text = '';
      }
      state.mapController?.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            bearing: 0,
            target: newPosition,
            tilt: 0,
            zoom: 17,
          ),
        ),
      );
      state = state.copyWith(
        isLoading: false,
        location: models.LocalLocation(
          latitude: newPosition.latitude,
          longitude: newPosition.longitude,
        ),
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> fetchShowLocation(int addressID) async {
    state = state.copyWith(
      onEditLoading: true,
    );
    final response = await _addressRepository.getShowAddress(addressID);
    response.when(success: (data) {
      state = state.copyWith(
          onEditLoading: false,
          location: data.localLocation,
          title: data.title ?? '');
    }, failure: (failure) {
      state = state.copyWith(onEditLoading: false);
      debugPrint('==> fetch show addresses failure: $failure');
    });
  }

  Future<void> findMyLocation(BuildContext context) async {
    location.LocationData? myLocationData;
    final locationInstance = location.Location();
    bool serviceEnabled;
    location.PermissionStatus permissionGranted;

    serviceEnabled = await locationInstance.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await locationInstance.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await locationInstance.hasPermission();
    if (permissionGranted == location.PermissionStatus.denied) {
      permissionGranted = await locationInstance.requestPermission();
      if (permissionGranted != location.PermissionStatus.granted) {
        return;
      }
    }
    try {
      myLocationData = await locationInstance.getLocation();
    } on Exception {
      myLocationData = null;
    }

    if (myLocationData != null) {
      if (mounted) {
        goToMyLocation(context, myLocationData);
      }
    }
  }

  Future<void> goToTappedLocation(BuildContext context, LatLng latLng) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true, searchedLocations: []);
      try {
        final List<Placemark> placemarks = await placemarkFromCoordinates(
          latLng.latitude,
          latLng.longitude,
          localeIdentifier: 'en',
        );
        if (placemarks.isNotEmpty) {
          final Placemark pos = placemarks[0];
          final List<String> addressData = [];
          if (pos.locality != null && pos.subLocality!.isNotEmpty) {
            addressData.add(pos.locality!);
          }
          if (pos.subLocality != null && pos.subLocality!.isNotEmpty) {
            addressData.add(pos.subLocality!);
          }
          if (pos.thoroughfare != null && pos.thoroughfare!.isNotEmpty) {
            addressData.add(pos.thoroughfare!);
          }
          addressData.add(pos.name!);
          final String placeName = addressData.join(', ');
          state.textController?.text = placeName;
        }
      } catch (e) {
        state.textController?.text = '';
      }
      state.mapController?.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            bearing: 0,
            target: latLng,
            tilt: 0,
            zoom: 14,
          ),
        ),
      );
      state = state.copyWith(
        isLoading: false,
        location: models.LocalLocation(
          latitude: latLng.latitude,
          longitude: latLng.longitude,
        ),
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  Future<void> createAddress(
    BuildContext context,
    bool? hasBack, {
    int? countryID,
    int? regionID,
    int? cityID,
    VoidCallback? onBack,
    VoidCallback? onGoMain,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isSaving: true);
      final List<models.AddressData> localAddresses =
          LocalStorage.instance.getNewAddresses();
      for (int i = 0; i < localAddresses.length; i++) {
        if (localAddresses[i].active ?? false) {
          final updated = localAddresses[i].copyWith(active: false);
          localAddresses[i] = updated;
        }
      }
      localAddresses.insert(
        0,
        models.AddressData(
          title: state.title,
          localLocation: state.location,
          address: state.textController?.text,
          isDefault: false,
          active: true,
        ),
      );
      final response = await _addressRepository.createAddress(
          localAddresses.first ,0 ,0 ,0);
      response.when(
        success: (data) {
          LocalStorage.instance.setActiveAddressTile(state.title);
          // await Future.delayed(const Duration(seconds: 3));
          if (hasBack ?? false) {
            onBack?.call();
          } else {
            LocalStorage.instance.setAddressSelected(true);
            onGoMain?.call();
          }
          clearSearchField();
          state.mapController?.dispose();
          state = state.copyWith(isSaving: false);
        },
        failure: (failure) {
          if (failure == const NetworkExceptions.unauthorisedRequest()) {
            LocalStorage.instance.deleteToken();
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.youNeedToLoginFirst),
            );
            context.router.pushAndPopUntil(
              const LoginRoute(),
              predicate: (route) => false,
            );
          }
          debugPrint('==> get profile details failure: $failure');
          state = state.copyWith(isSaving: false);
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  void setIDIndex({required int id, required int index}) {
    state = state.copyWith(id: id, index: index);
  }

  Future<void> editAddress(
      BuildContext context, {
        VoidCallback? onBack,
      }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isSaving: true);
      final List<AddressData> localAddresses =
      LocalStorage.instance.getNewAddresses();
      for (int i = 0; i < localAddresses.length; i++) {
        if (localAddresses[i].active ?? false) {
          final updated = localAddresses[i].copyWith(active: false);
          localAddresses[i] = updated;
        }
      }
      localAddresses[state.index] = AddressData(
        title: state.title,
        localLocation: state.location,
        address: state.textController?.text,
        isDefault: false,
        active: true,
      );
      final response = await _addressRepository.editAddress(
          localAddresses[state.index], state.id);
      response.when(
        success: (data) {
          // await Future.delayed(const Duration(seconds: 3));
            onBack?.call();
          clearSearchField();
          state.mapController?.dispose();
          state = state.copyWith(isSaving: false);
        },
        failure: (failure) {
          if (failure == const NetworkExceptions.unauthorisedRequest()) {
            LocalStorage.instance.deleteToken();
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.youNeedToLoginFirst),
            );
            context.router.pushAndPopUntil(
              const LoginRoute(),
              predicate: (route) => false,
            );
          }
          debugPrint('==> get editAddress details failure: $failure');
          state = state.copyWith(isSaving: false);
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }



  Future<void> fetchLocationName(BuildContext context, LatLng? latLng) async {
    state = state.copyWith(
      location: models.LocalLocation(
        latitude: latLng?.latitude,
        longitude: latLng?.longitude,
      ),
    );
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      try {
        final List<Placemark> placemarks = await placemarkFromCoordinates(
          latLng?.latitude ??
              (AppHelpers.getInitialLatitude() ?? AppConstants.demoLatitude),
          latLng?.longitude ??
              (AppHelpers.getInitialLongitude() ?? AppConstants.demoLongitude),
          localeIdentifier: 'en',
        );

        if (placemarks.isNotEmpty) {
          final Placemark pos = placemarks[0];
          final List<String> addressData = [];
          addressData.add(pos.locality!);
          if (pos.subLocality != null && pos.subLocality!.isNotEmpty) {
            addressData.add(pos.subLocality!);
          }
          if (pos.thoroughfare != null && pos.thoroughfare!.isNotEmpty) {
            addressData.add(pos.thoroughfare!);
          }
          addressData.add(pos.name!);
          final String placeName = addressData.join(', ');
          state.textController?.text = placeName;
        }
      } catch (e) {
        state.textController?.text = '';
      }
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }
}
