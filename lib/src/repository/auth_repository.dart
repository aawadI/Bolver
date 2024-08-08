import 'package:flutter/cupertino.dart';

import '../models/models.dart';
import '../core/handlers/handlers.dart';
import '../models/response/firebase_register_response.dart';

abstract class AuthRepository {
  Future<ApiResult<LoginResponse>> login({
    required String email,
    required String password,
  });

  Future<ApiResult<FirebaseResponse>> firebaseRegister({
    required String firstName,
    required String lastName,
    String? birthdate,
    String? gender,
    String? phone,
    String? email,
    String? password,
    String? passwordConfirm,
  });

  Future<ApiResult<LoginResponse>> loginWithSocial({
    required String email,
    required String displayName,
    required String id,
  });

  Future<ApiResult> sendOtp({required BuildContext context, required String phone});

  Future<ApiResult<RegisterResponse>> forgotPassword({required String phone});

  Future<ApiResult> verifyPhone({
    required String verifyCode,
  });

  Future<ApiResult<VerifyPhoneResponse>> forgotPasswordConfirm({
    required String verifyId,
    required String verifyCode,
  });
}
