import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../state/splash_state.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../repository/repository.dart';
import '../../../../../../core/routes/app_router.gr.dart';

class SplashNotifier extends StateNotifier<SplashState> {
  final SettingsRepository _settingsRepository;
  final UserRepository _userRepository;

  SplashNotifier(this._settingsRepository, this._userRepository)
      : super(const SplashState());

  Future<void> fetchProfileDetails() async {
    final response = await _userRepository.getProfileDetails();
    response.when(
      success: (data) {
        LocalStorage.instance.setUser(data.data);
        if (data.data?.wallet != null) {
          LocalStorage.instance.setWalletData(data.data?.wallet);
        }
        if(data.data?.addresses != null) {
          LocalStorage.instance.setNewAddresses(data.data?.addresses);
        }
      },
      failure: (failure) {
        debugPrint('==> error with fetching profile $failure');
      },
    );
  }

  Future<void> getActiveLanguages(
    BuildContext context, {
    VoidCallback? goMain,
    VoidCallback? goLogin,
    VoidCallback? goToSelectLang,
  }) async {
    final connect = await AppConnectivity.connectivity();
    if (connect) {
      if (LocalStorage.instance.getToken().isNotEmpty) {
        String? token;
        try {
          token = await FirebaseMessaging.instance.getToken();
        } catch (e) {
          debugPrint('===> error with getting firebase token');
        }
        _userRepository.updateFirebaseToken(token);
      }
      FirebaseMessaging.onMessage.listen(
        (RemoteMessage message) {
          debugPrint('===> new firebase notification: ${message.data}');
          debugPrint(
              '===> new firebase notification: ${message.notification?.title}');
          debugPrint(
              '===> new firebase notification: ${message.notification?.body}');
          debugPrint('===> new firebase notification: ${message.toString()}');
        },
      );
      final response = await _settingsRepository.getGlobalSettings();
      response.when(
        success: (data) {
          LocalStorage.instance.setSettingsList(data.data ?? []);
        },
        failure: (failure) {
          debugPrint('==> error with settings fetched');
        },
      );
      final storage = LocalStorage.instance;
      if (storage.getLangSelected()) {
        if (storage.getToken().isEmpty) {
          if (storage.getIsGuest()) {
            goMain?.call();
          } else {
            goLogin?.call();
          }
        } else {
          goMain?.call();
        }
      } else {
        goToSelectLang?.call();
      }
    } else {
      if (!mounted) return;
      context.replaceRoute(const NoConnectionRoute());
    }
  }

  Future<void> getTranslations(BuildContext context) async {
    final connect = await AppConnectivity.connectivity();
    if (connect) {
      final response = await _settingsRepository.getMobileTranslations();
      response.when(
        success: (data) {
          LocalStorage.instance.setTranslations(data.data);
        },
        failure: (failure) {
          debugPrint('==> error with fetching translations $failure');
        },
      );
    } else {
      if (!mounted) return;
      context.replaceRoute(const NoConnectionRoute());
    }
  }
}
