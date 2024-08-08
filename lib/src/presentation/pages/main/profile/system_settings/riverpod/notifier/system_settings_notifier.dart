import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/system_settings_state.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';

class SystemSettingsNotifier extends StateNotifier<SystemSettingsState> {
  final CurrenciesRepository _currenciesRepository;
  final UserRepository _userRepository;

  SystemSettingsNotifier(this._currenciesRepository, this._userRepository)
      : super(const SystemSettingsState());

  Future<void> changeCurrency(CurrencyData currency) async {
    LocalStorage.instance.setSelectedCurrency(currency);
    state = state.copyWith();
    if (LocalStorage.instance.getUser() == null) {
      return;
    }
    final response = await _userRepository.getProfileDetails();
    response.when(
      success: (data) {
        LocalStorage.instance.setWalletData(data.data?.wallet);
      },
      failure: (fail) {
        debugPrint('==> get profile details failure: $fail');
      },
    );
  }

  Future<void> fetchCurrencies() async {
    if (state.currencies.isNotEmpty) {
      return;
    }
    state = state.copyWith(isLoading: true, currencies: []);
    final response = await _currenciesRepository.getCurrencies();
    response.when(
      success: (data) {
        state = state.copyWith(
          currencies: data.data ?? [],
          isLoading: false,
        );
      },
      failure: (fail) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> get currencies failure: $fail');
      },
    );
  }
}
