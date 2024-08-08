import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as location;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import '../state/new_address_state.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';
import '../../../../../../../core/constants/constants.dart';

class NewAddressNotifier extends StateNotifier<NewAddressState> {
  final AddressRepository addressRepository;
  String firstname = '';
  String lastname = '';
  String email = '';
  String phone = '';
  String companyName = '';
  String apartment = '';
  String townCity = '';
  String stateProvince = '';
  String postcodeZip = '';
  String passportNumber = '';
  String passportSecret = '';
  String addressName = '';

  NewAddressNotifier(this.addressRepository)
      : super(NewAddressState(addressController: TextEditingController()));

  Future<void> goToLocation({
    required Place place,
    GoogleMapController? mapController,
  }) async {
    final newPosition = LatLng(
      place.lat ,
      place.lon,
    );
    mapController?.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: newPosition,
          tilt: 0,
          zoom: 17,
        ),
      ),
    );
  }


  void setPassportPrefix(String value) {
    state = state.copyWith(passportPrefix: value);
  }

  Future<void> goToMyLocation(
    location.LocationData locationData,
    GoogleMapController? mapController,
  ) async {
    final newPosition = LatLng(
      locationData.latitude ??
          (AppHelpers.getInitialLatitude() ?? AppConstants.demoLatitude),
      locationData.longitude ??
          (AppHelpers.getInitialLongitude() ?? AppConstants.demoLongitude),
    );
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
        state.addressController?.text = placeName;
      }
    } catch (e) {
      state.addressController?.text = '';
    }
    mapController?.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: newPosition,
          tilt: 0,
          zoom: 17,
        ),
      ),
    );
  }

  Future<void> findMyLocation(GoogleMapController? mapController) async {
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
        goToMyLocation(myLocationData, mapController);
      }
    }
  }

  // Future<void> createNewAddress(
  //   LatLng? location, {
  //   AddressData? addressData,
  //   VoidCallback? success,
  //   VoidCallback? failed,
  // }) async {
  //   state = state.copyWith(isLoading: true);
  //   final request = NewAddressRequest(
  //     firstname: _firstname,
  //     lastname: _lastname,
  //     birthday: LocalStorage.instance.getUser()?.birthday?.substring(
  //             0, LocalStorage.instance.getUser()?.birthday?.indexOf(" ")) ??
  //         state.dob,
  //     email: _email,
  //     phone: _phone,
  //     apartment: _apartment,
  //     townCity: _townCity,
  //     postcode: _postcodeZip.isEmpty ? null : _postcodeZip,
  //     passportNumber: LocalStorage.instance.getUser()?.passportNumber ??
  //         '${state.passportPrefix}$_passportNumber',
  //     passportSecret:
  //         LocalStorage.instance.getUser()?.passportSecret ?? _passportSecret,
  //     gender: LocalStorage.instance.getUser()?.gender ?? state.male,
  //     addressTitle: _addressName,
  //     address: state.addressController?.text ?? '',
  //     location: location ??
  //         LatLng(
  //           AppHelpers.getInitialLatitude() ?? AppConstants.demoLatitude,
  //           AppHelpers.getInitialLongitude() ?? AppConstants.demoLongitude,
  //         ),
  //     companyName: _companyName.isEmpty ? null : _companyName,
  //     stateProvince: _stateProvince.isEmpty ? null : _stateProvince,
  //     note: _note.isEmpty ? null : _note,
  //   );
  //   final response = await _addressRepository.createNewAddress(request);
  //   response.when(
  //     success: (data) {
  //       state = state.copyWith(isLoading: false);
  //       List<AddressData> savedAddresses =
  //           LocalStorage.instance.getNewAddresses();
  //       for (int i = 0; i < savedAddresses.length; i++) {
  //         savedAddresses[i] = savedAddresses[i].copyWith(isSelected: false);
  //       }
  //       if (data.data != null) {
  //         savedAddresses.insert(0, data.data!.copyWith(isSelected: true));
  //       }
  //       LocalStorage.instance.setNewAddresses(savedAddresses);
  //       success?.call();
  //     },
  //     failure: (fail) {
  //       debugPrint('===> create new address fail $fail');
  //       state = state.copyWith(isLoading: false, isError: true);
  //       failed?.call();
  //     },
  //   );
  // }

  Future<void> fetchLocationName(LatLng? latLng) async {
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
        state.addressController?.text = placeName;
      }
    } catch (e) {
      state.addressController?.text = '';
    }
  }

  void setAddressName(String text) {
    addressName = text.trim();
  }

  void setMale(String value) {
    state = state.copyWith(male: value);
  }

  void setPassportSecret(String text) {
    passportSecret = text.trim();
  }

  void setPassportNumber(String text) {
    passportNumber = text.trim();
  }

  void setNote(String text) {
  }

  void setPostcodeZip(String text) {
    postcodeZip = text.trim();
  }

  void setStateProvince(String text) {
    stateProvince = text.trim();
  }

  void setTownCity(String text) {
    townCity = text.trim();
  }

  void setApartment(String text) {
    apartment = text.trim();
  }

  void setCompanyName(String text) {
    companyName = text.trim();
  }

  void setPhone(String text) {
    phone = text.trim();
  }

  void setEmail(String text) {
    email = text.trim();
    if (state.isError) {
      state = state.copyWith(isError: false);
    }
  }

  void setDob(DateTime? date) {
    final String formattedDate =
        DateFormat('yyyy-MM-dd').format(date ?? DateTime.now());
    state = state.copyWith(dob: formattedDate);
  }

  void setInitialInfo() {
    final user = LocalStorage.instance.getUser();
    state = state.copyWith(
      dob: user?.birthday?.substring(0, 10) ?? '',
      male: user?.gender ?? '',
    );
    firstname = user?.firstname ?? '';
    lastname = user?.lastname ?? '';
    email = user?.email ?? '';
    phone = user?.phone ?? '';
  }

  void setLastname(String text) {
    lastname = text.trim();
  }

  void setFirstname(String text) {
    firstname = text.trim();
  }
}
