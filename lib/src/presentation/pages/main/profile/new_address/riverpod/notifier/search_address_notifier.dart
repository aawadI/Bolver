import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import '../state/search_address_state.dart';

class SearchAddressNotifier extends StateNotifier<SearchAddressState> {
  Timer? _timer;

  SearchAddressNotifier() : super(const SearchAddressState());

  void setQuery(String text) {
    if (text.trim().isNotEmpty) {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          _searchLocations(text.trim());
        },
      );
    }
  }

  Future<void> _searchLocations(String text) async {
      state = state.copyWith(isSearching: true);
      final result = await Nominatim.searchByName(
        query: text,
        limit: 5,
        addressDetails: true,
        extraTags: true,
        nameDetails: true,
      );
      state = state.copyWith(
        searchedLocations: result,
        isSearching: false,
      );
  }
}
