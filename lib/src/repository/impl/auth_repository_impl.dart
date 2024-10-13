import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:g_customer/src/core/utils/app_helpers.dart';
import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';
import '../../core/utils/local_storage.dart';
import '../../models/models.dart';
import '../../models/response/firebase_register_response.dart';
import '../repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  String? verificationId;
  // @override
  // Future<ApiResult<LoginResponse>> login({
  //   required String email,
  //   required String password,
  // }) async {
  //   final data = {'phone': email, 'password': password};
  //   try {
  //     final client = inject<HttpService>().client(requireAuth: false);
  //     final response = await client.post(
  //       '/api/v1/auth/login',
  //       queryParameters: data,
  //     );
  //     return ApiResult.success(
  //       data: LoginResponse.fromJson(response.data),
  //     );
  //   } catch (e) {
  //     debugPrint('==> login failure: $e');
  //     return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  //   }
  // }

  @override
  Future<ApiResult<LoginResponse>> login({
    required String email,
    required String password,
  }) async {
    final data = {'phone': "+966$email", 'password': password};
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      Response response = await _loginRequest(client, data);

      // Check if the response status code is 301
      while (response.statusCode == 301) {
        // Get the new location from the response headers
        final newLocation = response.headers['location']?.first;

        // Retry the request with the new location
        response = await _loginRequest(client, data, url: newLocation);
      }

      // Return the result
      return ApiResult.success(
        data: LoginResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> login failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  // Future<Response> _loginRequest(Dio client, Map<String, dynamic> data,
  //     {String? url}) async {
  //   try {
  //     final response =
  //         await client.post(url ?? '/api/v1/auth/login', queryParameters: data);
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<Response> _loginRequest(Dio client, Map<String, dynamic> data, {String? url}) async {
  //   try {
  //     final formData = FormData.fromMap(data);
  //     final response = await client.post(
  //       url ?? '/api/v1/auth/login',
  //       data: formData,
  //     );
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }


  String formatPhoneNumber(String phoneNumber) {
    // Remove all non-digit characters
    String cleanedPhoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Add the country code and format the phone number
    String formattedPhoneNumber = '+${cleanedPhoneNumber.substring(0, 3)} ${cleanedPhoneNumber.substring(3, 6)} ${cleanedPhoneNumber.substring(6, 9)} ${cleanedPhoneNumber.substring(9)}';

    return formattedPhoneNumber;
  }

  Future<Response> _loginRequest(Dio client, Map<String, dynamic> data, {String? url}) async {
    try {
      // Format the phone number
      String phoneNumber = data['phone'];
      String formattedPhoneNumber = formatPhoneNumber(phoneNumber);
      data['phone'] = formattedPhoneNumber;

      final formData = FormData.fromMap(data);
      final response = await client.post(
        url ?? '/api/v1/auth/login',
        data: formData,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiResult<FirebaseResponse>> firebaseRegister({
    required String firstName,
    required String lastName,
    String? birthdate,
    String? gender,
    String? phone,
    String? email,
    String? password,
    String? passwordConfirm,
  }) async {
    final data = {
      if (firstName.isNotEmpty) 'firstname': firstName,
      if (lastName.isNotEmpty) 'lastname': lastName,
      if (gender != null) 'gender': gender,
      if (phone != null) 'phone': phone,
      if (email != null && email.isNotEmpty) 'email': email,
      if (birthdate != null) 'birthday': birthdate,
      if (gender != null) 'gender': gender,
      if (password != null) 'password': password,
      if (passwordConfirm != null) 'password_confirmation': passwordConfirm,
    };
    debugPrint('===> update firebase info data ${jsonEncode(data)}');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post(
        '/api/v1/auth/after-verify',
        data: data,
      );
      return ApiResult.success(
        data: FirebaseResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> update profile details failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<LoginResponse>> loginWithSocial({
    required String email,
    required String displayName,
    required String id,
  }) async {
    final data = {
      'email': email,
      'name': displayName,
      'id': id,
    };
    debugPrint('===> login request $data');
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.post(
        '/api/v1/auth/google/callback',
        queryParameters: data,
      );
      return ApiResult.success(data: LoginResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> login with google failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> sendOtp(
      {required BuildContext context, required String phone}) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        timeout: const Duration(seconds: 120),
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) {
          verificationId = credential.verificationId.toString();
          debugPrint(
              '==> send otp verification completed: ${jsonEncode(credential)}');
        },
        verificationFailed: (FirebaseAuthException e) {
          debugPrint('==> send otp verification failed: ${e.message}');
          AppHelpers.showCheckFlash(context, e.message.toString());
        },
        codeSent: (String verification, int? resendToken) {
          verificationId = verification;
          debugPrint('==> send otp verification: $verification');
        },
        codeAutoRetrievalTimeout: (String verification) {
          verificationId = verification;
          debugPrint('==> send otp code auto retrieval timeout: $verification');
        },
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> send otp failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> verifyPhone({
    required String verifyCode,
  }) async {
    try {
      debugPrint('==> verify phone request: $verificationId $verifyCode');

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId ?? '',
        smsCode: verifyCode,
      );

      var res = await FirebaseAuth.instance.signInWithCredential(credential);
      await LocalStorage.instance.setToken(res.credential?.accessToken ?? "");
      return ApiResult.success(
        data: res.credential?.accessToken,
      );
    } catch (e) {
      debugPrint('==> verify phone failure: $e');
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
      );
    }
  }

  // @override
  // Future<ApiResult<RegisterResponse>> sendOtp({required String phone}) async {
  //   final data = {'phone': phone};
  //   try {
  //     final client = inject<HttpService>().client(requireAuth: false);
  //     final response = await client.post(
  //       '/api/v1/auth/register',
  //       data: data,
  //     );
  //     return ApiResult.success(data: RegisterResponse.fromJson(response.data));
  //   } catch (e) {
  //     debugPrint('==> send otp failure: $e');
  //     return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  //   }
  // }

  // @override
  // Future<ApiResult<VerifyPhoneResponse>> verifyPhone({
  //   required String verifyId,
  //   required String verifyCode,
  // }) async {
  //   final data = {'verifyId': verifyId, 'verifyCode': verifyCode};
  //   try {
  //     final client = inject<HttpService>().client(requireAuth: false);
  //     final response = await client.post(
  //       '/api/v1/auth/verify/phone',
  //       data: data,
  //     );
  //     return ApiResult.success(
  //         data: VerifyPhoneResponse.fromJson(response.data));
  //   } catch (e) {
  //     debugPrint('==> verify phone failure: $e');
  //     return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  //   }
  // }

  @override
  Future<ApiResult<RegisterResponse>> forgotPassword({
    required String phone,
  }) async {
    final data = {'phone': phone};
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.post(
        '/api/v1/auth/forgot/password',
        data: data,
      );
      return ApiResult.success(data: RegisterResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> forgot password failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<VerifyPhoneResponse>> forgotPasswordConfirm({
    required String verifyId,
    required String verifyCode,
  }) async {
    final data = {'verifyId': verifyId, 'verifyCode': verifyCode};
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.post(
        '/api/v1/auth/forgot/password/confirm',
        data: data,
      );
      return ApiResult.success(
        data: VerifyPhoneResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> forgot password confirm failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
