import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import '../state/enter_phone_state.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';
import '../../../../../../../core/handlers/handlers.dart';
import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/routes/app_router.gr.dart';

class EnterPhoneNotifier extends StateNotifier<EnterPhoneState> {
  final AuthRepository _authRepository;
  final CurrenciesRepository _currenciesRepository;
  final AddressRepository _addressRepository;
  final UserRepository _userRepository;

  EnterPhoneNotifier(
    this._authRepository,
    this._currenciesRepository,
    this._addressRepository,
    this._userRepository,
  ) : super(const EnterPhoneState(agreedToPrivacy: false));

  void setPhone(String text) {
    state = state.copyWith(phone: text.trim());
  }

  void setVerifyId(String? value) {
    state = state.copyWith(verifyId: value?.trim() ?? '');
  }

  void toggleAgreed() {
    state = state.copyWith(agreedToPrivacy: !state.agreedToPrivacy);
  }

  void clearStates() {
    state = state.copyWith(agreedToPrivacy: false, phone: '');
  }

  Future<void> sendOtp(BuildContext context) async {
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
          context.pushRoute(const RegisterConfirmationRoute());
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

  Future<void> registerWithGoogle(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isGoogleLoading: true);
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        state = state.copyWith(isGoogleLoading: false);
        return;
      }

      final response = await _authRepository.loginWithSocial(
        email: googleUser.email,
        displayName: googleUser.displayName ?? '',
        id: googleUser.id,
      );
      response.when(
        success: (data) async {
          LocalStorage.instance.setUser(data.data?.user);
          LocalStorage.instance.setToken(data.data?.accessToken ?? '');
          LocalStorage.instance.setFirstName(data.data?.user?.firstname);
          LocalStorage.instance.setLastName(data.data?.user?.lastname);
          LocalStorage.instance.setProfileImage(data.data?.user?.img);
          fetchCurrencies(context);
          final addressResponse = await _addressRepository.getUserAddresses();
          addressResponse.when(
            success: (addressData) async {
              state = state.copyWith(isGoogleLoading: false);
              saveAddressesToLocal(addressData.data);
              context.replaceRoute(const ShopMainRoute());
            },
            failure: (addressFailure) {
              state = state.copyWith(isLoading: false);
              debugPrint('==> address failure: $addressFailure');
            },
          );
        },
        failure: (failure) {},
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> registrationWithApple(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isAppleLoading: true);

      try {
        final credential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
        );
        final response = await _authRepository.loginWithSocial(
          email:
              credential.email ?? credential.authorizationCode.substring(0, 8),
          displayName: credential.givenName ??
              credential.authorizationCode.substring(0, 8),
          id: credential.userIdentifier ?? "",
        );
        response.when(
          success: (data) async {
            LocalStorage.instance.setUser(data.data?.user);
            LocalStorage.instance.setToken(data.data?.accessToken ?? '');
            LocalStorage.instance.setFirstName(data.data?.user?.firstname);
            LocalStorage.instance.setLastName(data.data?.user?.lastname);
            LocalStorage.instance.setProfileImage(data.data?.user?.img);
            LocalStorage.instance.setAuthenticatedWithSocial(true);
            fetchCurrencies(context);
            final fcmToken = await FirebaseMessaging.instance.getToken();
            _userRepository.updateFirebaseToken(fcmToken);
            final addressResponse = await _addressRepository.getUserAddresses();
            addressResponse.when(
              success: (addressData) {
                state = state.copyWith(isAppleLoading: false);
                saveAddressesToLocal(addressData.data);
                context.router.popUntilRoot();
                context.replaceRoute(const ShopMainRoute());
              },
              failure: (addressFailure) {
                state = state.copyWith(isLoading: false);
                debugPrint('==> address failure: $addressFailure');
              },
            );
          },
          failure: (failure) {},
        );
      } catch (e) {
        state = state.copyWith(isAppleLoading: false);
        debugPrint('===> login with apple exception: $e');
        if (mounted) {
          AppHelpers.showCheckFlash(
            context,
            AppHelpers.getTranslation(e.toString()),
          );
        }
      }
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> registerWithFacebook(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isFacebookLoading: true);
      final fb = FacebookLogin();
      try {
        final user = await fb.logIn(permissions: [FacebookPermission.email]);
        if (user.status == FacebookLoginStatus.success) {
          final response = await _authRepository.loginWithSocial(
            email: user.accessToken?.permissions.first ?? "",
            displayName: user.accessToken?.userId ?? '',
            id: user.accessToken?.token ?? "",
          );
          response.when(
            success: (data) async {
              LocalStorage.instance.setUser(data.data?.user);
              LocalStorage.instance.setToken(data.data?.accessToken ?? '');
              LocalStorage.instance.setFirstName(data.data?.user?.firstname);
              LocalStorage.instance.setLastName(data.data?.user?.lastname);
              LocalStorage.instance.setProfileImage(data.data?.user?.img);
              LocalStorage.instance.setAuthenticatedWithSocial(true);
              fetchCurrencies(context);
              final fcmToken = await FirebaseMessaging.instance.getToken();
              _userRepository.updateFirebaseToken(fcmToken);
              final addressResponse =
                  await _addressRepository.getUserAddresses();
              addressResponse.when(
                success: (addressData) {
                  state = state.copyWith(isFacebookLoading: false);
                  saveAddressesToLocal(addressData.data);
                  context.router.popUntilRoot();
                  context.replaceRoute(const ShopMainRoute());
                },
                failure: (addressFailure) {
                  state = state.copyWith(isLoading: false);
                  debugPrint('==> address failure: $addressFailure');
                },
              );
            },
            failure: (failure) {},
          );
        }
      } catch (e) {
        state = state.copyWith(isFacebookLoading: false);
        debugPrint('===> login with google exception: $e');
        if (mounted) {
          AppHelpers.showCheckFlash(
            context,
            AppHelpers.getTranslation(e.toString()),
          );
        }
      }
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  bool saveAddressesToLocal(List<AddressData>? data) {
    if (data == null || data.isEmpty) {
      return false;
    } else {
      String title = '';
      int activeIndex = 0;
      final List<AddressData> localAddresses = [];
      for (int i = 0; i < data.length; i++) {
        final double? latitude =
            double.tryParse(data[i].location?.latitude.toString() ?? '');
        final double? longitude =
            double.tryParse(data[i].location?.longitude.toString() ?? '');
        if (latitude != null && longitude != null) {
          final local = AddressData(
            id: data[i].id,
            title: data[i].title,
            address: data[i].address,
            location: Location(
              latitude: double.parse(data[i].location?.latitude.toString() ?? ''),
              longitude: double.parse(data[i].location?.longitude.toString() ?? ''),
            ),
            isDefault: false,
            isSelected: false,
          );
          localAddresses.add(local);
          if (data[i].isDefault ?? false) {
            activeIndex = i;
          }
        }
      }
      final local = localAddresses[activeIndex]
          .copyWith(isSelected: true, isDefault: true);
      localAddresses[activeIndex] = local;
      title = localAddresses[activeIndex].title ?? '';
      LocalStorage.instance.setNewAddresses(localAddresses);
      LocalStorage.instance.setActiveAddressTile(title);
      LocalStorage.instance.setAddressSelected(true);
      return true;
    }
  }

  Future<void> fetchCurrencies(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isCurrenciesLoading: true);
      final response = await _currenciesRepository.getCurrencies();
      response.when(
        success: (data) async {
          int defaultCurrencyIndex = 0;
          final List<CurrencyData> currencies = data.data ?? [];
          for (int i = 0; i < currencies.length; i++) {
            if (currencies[i].isDefault ?? false) {
              defaultCurrencyIndex = i;
              break;
            }
          }
          LocalStorage.instance
              .setSelectedCurrency(currencies[defaultCurrencyIndex]);
          state = state.copyWith(isCurrenciesLoading: false);
        },
        failure: (failure) {
          state = state.copyWith(isCurrenciesLoading: false);
          debugPrint('==> get currency failure: $failure');
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
