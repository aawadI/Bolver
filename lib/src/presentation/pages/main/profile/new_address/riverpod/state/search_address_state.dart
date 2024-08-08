import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:osm_nominatim/osm_nominatim.dart';

part 'search_address_state.freezed.dart';

@freezed
class SearchAddressState with _$SearchAddressState {
  const factory SearchAddressState({
    @Default(false) bool isSearching,
    @Default([]) List<Place> searchedLocations,
  }) = _SearchAddressState;

  const SearchAddressState._();
}