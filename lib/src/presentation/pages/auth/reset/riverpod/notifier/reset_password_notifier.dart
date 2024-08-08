import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/handlers/handlers.dart';
import '../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../repository/repository.dart';
import '../state/reset_password_state.dart';

class ResetPasswordNotifier extends StateNotifier<ResetPasswordState> {
  final AuthRepository _authRepository;

  ResetPasswordNotifier(this._authRepository)
      : super(const ResetPasswordState());

  void setPhone(String text) {
    state = state.copyWith(phone: text.trim(), isPhoneError: false);
  }

  void setVerifyId(String? value) {
    state = state.copyWith(verifyId: value?.trim() ?? '');
  }

  Future<void> sendCode(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      // ignore: use_build_context_synchronously
      final response = await _authRepository.sendOtp(phone: state.phone.trim(), context: context);
      response.when(
        success: (data) async {
          state = state.copyWith(
            // verifyId: data?.verifyId ?? '',
            isLoading: false,
          );
          context.pushRoute(const ResetConfirmationRoute());
        },
        failure: (failure) {
          state = state.copyWith(isLoading: false);
          if (failure == const NetworkExceptions.badRequest()) {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.smsDidntSend),
            );
          }
          debugPrint('==> send otp failure: $failure');
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
}
