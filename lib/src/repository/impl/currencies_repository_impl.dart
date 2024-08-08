import 'package:flutter/material.dart';

import '../repository.dart';
import '../../models/models.dart';
import '../../core/utils/utils.dart';
import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';

class CurrenciesRepositoryImpl extends CurrenciesRepository {
  @override
  Future<ApiResult<CurrenciesResponse>> getCurrencies() async {
    final data = {'lang': LocalStorage.instance.getLanguage()?.locale};
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/currencies/active',
        queryParameters: data,
      );
      return ApiResult.success(
        data: CurrenciesResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get currencies failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
