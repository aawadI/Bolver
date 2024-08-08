import 'package:flutter/material.dart';

import '../repository.dart';
import '../../models/models.dart';
import '../../core/utils/utils.dart';
import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  @override
  Future<ApiResult<ExtraGroupsResponse>> getExtraGroups() async {
    final data = {
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response =
          await client.get('/api/v1/rest/extra-group', queryParameters: data);
      return ApiResult.success(
        data: ExtraGroupsResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('===> getting extra groups error $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<FiltersResponse>> getCategoryFilters({
    int? categoryId,
  }) async {
    final data = {
      'lang': LocalStorage.instance.getLanguage()?.locale,
      'parent_category_id': categoryId,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response =
          await client.get('/api/v1/rest/filter', queryParameters: data);
      return ApiResult.success(data: FiltersResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('===> get filters error $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<CategoryDetailsResponse>> getCategoryDetails({
    String? uuid,
  }) async {
    final data = {
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/categories/$uuid',
        queryParameters: data,
      );
      return ApiResult.success(
        data: CategoryDetailsResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get category details: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<CategoriesPaginateResponse>> getAllCategories({bool? mostSold}) async {
    final data = {
      'per_page': 10,
      'lang': LocalStorage.instance.getLanguage()?.locale,
      if(mostSold != null) 'most_sold' : mostSold
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/categories/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: CategoriesPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get categories failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
