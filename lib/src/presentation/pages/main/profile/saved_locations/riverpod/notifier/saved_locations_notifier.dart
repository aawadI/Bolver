import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'dart:ui' as ui;
import '../state/saved_locations_state.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';
import '../../../../../../../core/constants/constants.dart';

class SavedLocationsNotifier extends StateNotifier<SavedLocationsState> {
  final AddressRepository _addressRepository;
  int _userAddress = 0;
  bool _hasMoreOpen = false;
  int _locationPage = 1;


  SavedLocationsNotifier(this._addressRepository)
      : super(const SavedLocationsState());

  void makeDefaultAddress(int index) {
    state = state.copyWith(isUpdating: true);
    List<AddressData> addresses = LocalStorage.instance.getNewAddresses();
    if (addresses[index].active ?? false) {
      state = state.copyWith(isUpdating: false);
      return;
    }
    for (int i = 0; i < addresses.length; i++) {
      addresses[i] = addresses[i].copyWith(active: false);
    }
    addresses[index] = addresses[index].copyWith(active: true);
    LocalStorage.instance.setNewAddresses(addresses);
    LocalStorage.instance.setActiveAddressTile(addresses[index].title ?? '');
    state = state.copyWith(isUpdating: false);
  }

  Future<void> deleteNewAddress(AddressData? address,BuildContext context) async {
    state = state.copyWith(isUpdating: false);
    int? index;
    final List<AddressData> addresses = List.from(state.addresses);
    if (address?.id != null) {
      final response = await _addressRepository.deleteAddress(address?.id ?? 0);
      response.when(
        success: (data) {
          for (int i = 0; i < addresses.length; i++) {
            if (address?.id == addresses[i].id) {
              index = i;
              break;
            }
          }
          if (index != null) {
            addresses.removeAt(index!);
          }
          state = state.copyWith(isUpdating: false);
          fetchSavedLocations();
        },
        failure: (fail) {
          state = state.copyWith(isUpdating: false);
          debugPrint('==> delete addresses failure: $fail');
          AppHelpers.showCheckFlash(context, AppHelpers.getTranslation(TrKeys.addressError));
          return;
        },
      );
    }
  }

  Future<void> fetchMoreSavedLocations() async {
    if (_hasMoreOpen) {
      return;
    }
    state = state.copyWith(isMoreLoading: true);
    final response = await _addressRepository.getUserAddresses(pageCount: ++_locationPage);
    response.when(
      success: (data) async {
        final List<AddressData> newLocation = data.data ?? [];
        List<AddressData> addresses =  LocalStorage.instance.getNewAddresses();
        addresses.addAll(newLocation);
        LocalStorage.instance.setNewAddresses(addresses);
        //final Uint8List? customIcon = await getBytesFromAsset(AppAssets.pngIcLocationPin, 150);

        // const MarkerId markerId = MarkerId('markerId');
        // List<Map<MarkerId, Marker>> listOfMarkers = [];
        // for (int i = 0; i < addresses.length; i++) {
        //   final Marker marker = Marker(
        //     markerId: markerId,
        //     position: LatLng(
        //       double.tryParse(addresses[i].location?.latitude.toString() ?? '') ??
        //           (AppHelpers.getInitialLatitude() ??
        //               AppConstants.demoLatitude),
        //       double.tryParse(addresses[i].location?.longitude.toString() ?? '') ??
        //           (AppHelpers.getInitialLongitude() ??
        //               AppConstants.demoLongitude),
        //     ),
        //     draggable: false,
        //     icon: BitmapDescriptor.fromBytes(customIcon!),
        //   );
        //   final Map<MarkerId, Marker> markerData = {};
        //   markerData[markerId] = marker;
        //   listOfMarkers.add(markerData);
        // }
        state = state.copyWith(isMoreLoading: false);
        _hasMoreOpen = newLocation.length >= (data.meta?.total ?? 0);
      },
      failure: (fail) {
        _locationPage--;
        state = state.copyWith(isMoreLoading: false);
        debugPrint('===> fetch more open orders fail $fail');
      },
    );
  }

  Future<void> fetchSavedLocations() async {
    state = state.copyWith(isLoading: true, addresses: []);
    final response = await _addressRepository.getUserAddresses();
    response.when(
      success: (data) async {
        _locationPage = 1;
        _hasMoreOpen = false;
        List<AddressData> addresses = data.data ?? [];
        final List<AddressData> savedAddresses =
            LocalStorage.instance.getNewAddresses();
        // final Uint8List? customIcon = await getBytesFromAsset(AppAssets.pngIcLocationPin, 150);
        // const MarkerId markerId = MarkerId('markerId');
        // List<Map<MarkerId, Marker>> listOfMarkers = [];
        // for (int i = 0; i < addresses.length; i++) {
        //   final Marker marker = Marker(
        //     markerId: markerId,
        //     position: LatLng(
        //       double.tryParse(addresses[i].location?.latitude.toString() ?? '') ??
        //           (AppHelpers.getInitialLatitude() ??
        //               AppConstants.demoLatitude),
        //       double.tryParse(addresses[i].location?.longitude.toString() ?? '') ??
        //           (AppHelpers.getInitialLongitude() ??
        //               AppConstants.demoLongitude),
        //     ),
        //     draggable: false,
        //     icon: BitmapDescriptor.fromBytes(customIcon!),
        //   );
        //   final Map<MarkerId, Marker> markerData = {};
        //   markerData[markerId] = marker;
        //   listOfMarkers.add(markerData);
        // }

        if (addresses.isNotEmpty) {
          int selectedIndex = 0;
          for (int i = 0; i < savedAddresses.length; i++) {
            if (savedAddresses[i].active ?? false) {
              selectedIndex = i;
            }
          }
          int changeIndex = 0;
          if (savedAddresses.isNotEmpty) {
            for (int i = 0; i < addresses.length; i++) {
              if (addresses[i].id == savedAddresses[selectedIndex].id) {
                changeIndex = i;
              }
            }
          }
          addresses[changeIndex] =
              addresses[changeIndex].copyWith(active: true);
          LocalStorage.instance.setNewAddresses(addresses);
          LocalStorage.instance
              .setActiveAddressTile(addresses[changeIndex].title ?? '');
        } else {
          LocalStorage.instance.setNewAddresses([]);
          LocalStorage.instance.setActiveAddressTile('');
        }
        state = state.copyWith(
          isLoading: false,
          addresses: addresses,
        );
      },
      failure: (fail) {
        debugPrint('===> fetch user addresses fail $fail');
        state = state.copyWith(isLoading: false);
      },
    );
  }

  Future<void> fetchSavedLocationsPage({RefreshController? controller}) async {
    final addressResponse =
    await _addressRepository.getUserAddresses();
    addressResponse.when(success: (data) async {
      List<AddressData>? list = List.from(state.addresses);
      if (data.data?.isNotEmpty ?? false) {
        _hasMoreOpen = false;
        _locationPage = 1;
        LocalStorage.instance.setNewAddresses(data.data);
        list.addAll(data.data ?? []);
        state = state.copyWith(addresses: list);
        controller?.loadComplete();
        final List<AddressData> localAddresses = list;
        // final customIcon = await BitmapDescriptor.fromAssetImage(
        //   ImageConfiguration(size: Size(36.44.r, 50.r)),
        //   AppAssets.pngIcLocationPin,
        // );
        // const MarkerId markerId = MarkerId('markerId');
        // List<Map<MarkerId, Marker>> listOfMarkers = [];
        // for (int i = 0; i < localAddresses.length; i++) {
        //   final Marker marker = Marker(
        //     markerId: markerId,
        //     position: LatLng(
        //       double.tryParse(localAddresses[i].location?.latitude.toString() ?? "") ??
        //           (AppHelpers.getInitialLatitude() ??
        //               AppConstants.demoLatitude),
        //       double.tryParse(localAddresses[i].location?.longitude.toString() ?? "") ??
        //           (AppHelpers.getInitialLongitude() ??
        //               AppConstants.demoLongitude),
        //     ),
        //     draggable: false,
        //     icon: customIcon,
        //   );
        //   final Map<MarkerId, Marker> markerData = {};
        //   markerData[markerId] = marker;
        //   listOfMarkers.add(markerData);
        // }
        state = state.copyWith(
          isLoading: false,
          addresses: localAddresses,
        );
      } else if (_userAddress == data.meta?.total) {
        controller?.loadNoData();
      } else {
        _userAddress--;
        controller?.loadNoData();
      }
    }, failure: (failure) {
      debugPrint('==> fetch addressesPage failure: $failure');
    });
  }

  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }
}
