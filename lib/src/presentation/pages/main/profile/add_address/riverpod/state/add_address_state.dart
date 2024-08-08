import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:osm_nominatim/osm_nominatim.dart';

import '../../../../../../../models/models.dart' as models;

part 'add_address_state.freezed.dart';

@freezed
class AddAddressState with _$AddAddressState {
  const factory AddAddressState({
    @Default(false) bool isLoading,
    @Default(false) bool isSearching,
    @Default(false) bool isSaving,
    @Default(false) bool isChoosing,
    @Default(false) bool onEditLoading,
    @Default(null) int? id,
    @Default(0) int index,
    @Default([]) List<Place> searchedLocations,
    @Default('') String title,
    TextEditingController? textController,
    GoogleMapController? mapController,
    models.LocalLocation? location,
    String? address,
  }) = _AddAddressState;

  const AddAddressState._();
}