import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import '../state/login_state.dart';
import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../repository/repository.dart';
import '../../../../../../core/routes/app_router.gr.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final AuthRepository _authRepository;
  final AddressRepository _addressRepository;
  final CurrenciesRepository _currenciesRepository;
  final UserRepository _userRepository;

  LoginNotifier(
    this._authRepository,
    this._addressRepository,
    this._currenciesRepository,
    this._userRepository,
  ) : super(const LoginState());

  void setPassword(String text) {
    state = state.copyWith(
      password: text.trim(),
      isLoginError: false,
      isEmailNotValid: false,
      isPasswordNotValid: false,
    );
  }

  void setEmail(String text) {
    state = state.copyWith(
      email: text.trim(),
      isLoginError: false,
      isEmailNotValid: false,
      isPasswordNotValid: false,
    );
  }

  void setShowPassword(bool show) {
    state = state.copyWith(showPassword: show);
  }

  Future<void> login({
    VoidCallback? checkYourNetwork,
    VoidCallback? success,
  }) async {
    if (await AppConnectivity.connectivity()) {
      if (!AppValidators.isValidPassword(state.password)) {
        state = state.copyWith(isPasswordNotValid: true);
        return;
      }
      state = state.copyWith(isLoading: true);
      final response = await _authRepository.login(
        email: state.email.replaceAll("+", ""),
        password: state.password,
      );
      response.when(
        success: (data) async {
          LocalStorage.instance.setUser(data.data?.user);
          LocalStorage.instance.setToken(data.data?.accessToken ?? '');
          LocalStorage.instance.setFirstName(data.data?.user?.firstname);
          LocalStorage.instance.setLastName(data.data?.user?.lastname);
          LocalStorage.instance.setProfileImage(data.data?.user?.img);
          _fetchCurrencies();
          _getProfileDetails();
          String? fcmToken;
          try {
            fcmToken = await FirebaseMessaging.instance.getToken();
          } catch (e) {
            debugPrint('===> getting firebase token error: $e');
          }
          _userRepository.updateFirebaseToken(fcmToken);
          final addressResponse = await _addressRepository.getUserAddresses();
          addressResponse.when(
            success: (addressData) async {
              state = state.copyWith(isLoading: false);
              _saveAddressesToLocal(addressData.data);
              success?.call();
            },
            failure: (addressFailure) {
              state = state.copyWith(isLoading: false);
              debugPrint('==> address failure: $addressFailure');
            },
          );
        },
        failure: (failure) {
          state = state.copyWith(isLoading: false, isLoginError: true);
          debugPrint('==> login failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  Future<void> _fetchCurrencies() async {
    final response = await _currenciesRepository.getCurrencies();
    response.when(
      success: (data) {
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
      },
      failure: (failure) {
        debugPrint('==> get currency failure: $failure');
      },
    );
  }

  Future<void> _getProfileDetails() async {
    final response = await _userRepository.getProfileDetails();
    response.when(
      success: (data) async {
        LocalStorage.instance.setWalletData(data.data?.wallet);
        LocalStorage.instance.setUser(data.data);
      },
      failure: (fail) {
        debugPrint('==> get profile details fail: $fail');
      },
    );
  }

  Future<void> loginWithGoogle({
    VoidCallback? checkNetwork,
    ValueSetter<String>? error,
    VoidCallback? success,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isGoogleLoading: true);
      GoogleSignInAccount? googleUser;
      try {
        googleUser = await GoogleSignIn().signIn();
      } catch (e) {
        state = state.copyWith(isGoogleLoading: false);
        debugPrint('===> login with google exception: $e');
        error?.call(e.toString());
      }
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
          LocalStorage.instance.setAuthenticatedWithSocial(true);
          _fetchCurrencies();
          _getProfileDetails();
          String? fcmToken;
          try {
            fcmToken = await FirebaseMessaging.instance.getToken();
          } catch (e) {
            debugPrint('===> error with getting firebase token');
          }
          _userRepository.updateFirebaseToken(fcmToken);
          final addressResponse = await _addressRepository.getUserAddresses();
          addressResponse.when(
            success: (addressData) {
              state = state.copyWith(isGoogleLoading: false);
              _saveAddressesToLocal(addressData.data);
              success?.call();
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
      checkNetwork?.call();
    }
  }

  Future<void> loginWithApple(BuildContext context) async {
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
          id: credential.userIdentifier ?? '',
        );
        response.when(
          success: (data) async {
            LocalStorage.instance.setUser(data.data?.user);
            LocalStorage.instance.setToken(data.data?.accessToken ?? '');
            LocalStorage.instance.setFirstName(data.data?.user?.firstname);
            LocalStorage.instance.setLastName(data.data?.user?.lastname);
            LocalStorage.instance.setProfileImage(data.data?.user?.img);
            LocalStorage.instance.setAuthenticatedWithSocial(true);
            _fetchCurrencies();
            _getProfileDetails();
            final fcmToken = await FirebaseMessaging.instance.getToken();
            _userRepository.updateFirebaseToken(fcmToken);
            final addressResponse = await _addressRepository.getUserAddresses();
            addressResponse.when(
              success: (addressData) {
                state = state.copyWith(isAppleLoading: false);
                _saveAddressesToLocal(addressData.data);
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

  Future<void> loginWithFacebook(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isFacebookLoading: true);
      final fb = FacebookLogin();
      debugPrint('===> login with face exceptio');
      try {
        final user = await fb.logIn(permissions: []);

        final OAuthCredential credential =
        FacebookAuthProvider.credential(user.accessToken?.token ?? "");

        final userObj =
        await FirebaseAuth.instance.signInWithCredential(credential);
        debugPrint(
            '===> login with face exception: ${user.accessToken?.declinedPermissions}');
        if (user.status == FacebookLoginStatus.success) {
          final response = await _authRepository.loginWithSocial(
            email: userObj.user?.email ?? "",
            displayName: userObj.user?.displayName ?? '',
            id: userObj.user?.uid ?? "",
          );
          response.when(
            success: (data) async {
              LocalStorage.instance.setUser(data.data?.user);
              LocalStorage.instance.setToken(data.data?.accessToken ?? '');
              LocalStorage.instance.setFirstName(data.data?.user?.firstname);
              LocalStorage.instance.setLastName(data.data?.user?.lastname);
              LocalStorage.instance.setProfileImage(data.data?.user?.img);
              LocalStorage.instance.setAuthenticatedWithSocial(true);
              _fetchCurrencies();
              _getProfileDetails();
              final fcmToken = await FirebaseMessaging.instance.getToken();
              _userRepository.updateFirebaseToken(fcmToken);
              final addressResponse =
                  await _addressRepository.getUserAddresses();
              addressResponse.when(
                success: (addressData) {
                  state = state.copyWith(isFacebookLoading: false);
                  _saveAddressesToLocal(addressData.data);
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

  bool _saveAddressesToLocal(List<AddressData>? data) {
    if (data == null || data.isEmpty) {
      return false;
    } else {
      String title = '';
      int activeIndex = 0;
      for (int i = 0; i < data.length; i++) {
        if (data[i].isDefault ?? false) {
          activeIndex = i;
        }
      }
      data[activeIndex] =
          data[activeIndex].copyWith(active: true, isDefault: true);
      title = data[activeIndex].title ?? '';
      LocalStorage.instance.setNewAddresses(data);
      LocalStorage.instance.setActiveAddressTile(title);
      LocalStorage.instance.setAddressSelected(true);
      return true;
    }
  }

  void skipForNow({VoidCallback? goToMain}) {
    LocalStorage.instance.setIsGuest(true);
    _fetchCurrencies();
    goToMain?.call();
  }
}
