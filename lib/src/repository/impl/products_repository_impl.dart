import 'package:flutter/material.dart';

import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';
import '../../core/utils/utils.dart';
import '../../models/models.dart';
import '../../models/response/all_products_paginate_response.dart';
import '../repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  @override
  Future<ApiResult<NewSearchResponse>> searchNewProducts({
    String? query,
  }) async {
    final data = {
      if (query != null) 'search': query,
      'perPage': 5,
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/search',
        queryParameters: data,
      );
      return ApiResult.success(
        data: NewSearchResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> search products failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProductsPaginateResponse>> searchProducts({
    String? query,
    int? categoryId,
    int? brandId,
    int? shopId,
  }) async {
    final data = {
      'search': query,
      'perPage': 5,
      if (categoryId != null) 'category_id': categoryId,
      if (brandId != null) 'brand_id': brandId,
      if (shopId != null) 'shop_id': shopId,
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ProductsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> search products failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<SingleProductResponse>> getProductDetails(
    String uuid,
  ) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>()
          .client(requireAuth: LocalStorage.instance.getToken().isNotEmpty);
      final response = await client.get(
        '/api/v1/rest/products/$uuid',
        queryParameters: data,
      );
      return ApiResult.success(
        data: SingleProductResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get product details failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProductsPaginateResponse>> getProductsPaginate({
    required int page,
    int? categoryId,
    int? brandId,
    int? parentID,
    int? parentCategoryId,
    CategoryData? childCategory,
    List<int>? shopIds,
    List<int>? brandIds,
    List<int>? extrasIds,
    double? minPrice,
    double? maxPrice,
    bool? sortPrice,
  }) async {
    final data = {
      if (brandId != null) 'brand_id': brandId,
      if (parentID != null) 'parent_category_id': parentID,
      // if (categoryId != null) 'categoryIds[]': categoryId,
      if (parentCategoryId != null) 'parent_category_id': parentCategoryId,
      'perPage': 10,
      'page': page,
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'lang': LocalStorage.instance.getLanguage()?.locale,
      if (sortPrice ?? false) 'sortByAsc': true,
      if (!(sortPrice ?? false)) 'sortByDesc': true,
      'column': 'created_at',
      if (minPrice != null) 'range[0]': minPrice,
      if (maxPrice != null) 'range[1]': maxPrice,
    };
    if (shopIds != null && shopIds.isNotEmpty) {
      for (int i = 0; i < shopIds.length; i++) {
        data['shopIds[$i]'] = shopIds[i];
      }
    }
    // if (childCategory != null) {
    //   data['categoryIds[0]'] = childCategory.id ?? 0;
    // }
    if (brandIds != null && brandIds.isNotEmpty) {
      for (int i = 0; i < brandIds.length; i++) {
        data['brandIds[$i]'] = brandIds[i];
      }
    }
    if (extrasIds != null && extrasIds.isNotEmpty) {
      for (int i = 0; i < extrasIds.length; i++) {
        data['extrasIds[$i]'] = extrasIds[i];
      }
    }

    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ProductsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get products by brand id failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProductsPaginateResponse>> getMostSoldProducts({
    required int page,
    int? shopId,
    int? categoryId,
    int? brandId,
  }) async {
    final data = {
      if (shopId != null) 'shop_id': shopId,
      if (categoryId != null) 'category_id': categoryId,
      if (brandId != null) 'brand_id': brandId,
      'perPage': 12,
      'page': page,
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/most-sold',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ProductsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get most sold products failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProductsPaginateResponse>> getRelatedProducts(
    int? brandId,
    int? shopId,
    int? categoryId,
  ) async {
    final data = {
      'brand_id': brandId,
      'shop_id': shopId,
      'category_id': categoryId,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ProductsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get products by brand id failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProductCalculateResponse>> getProductCalculations(
    int stockId,
    int quantity,
  ) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'products[0][id]': stockId,
      'products[0][quantity]': quantity,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/calculate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ProductCalculateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get product calculations failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProductCalculateResponse>> getAllCalculations(
    List<CartProductData> cartProducts,
  ) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
    };
    for (int i = 0; i < cartProducts.length; i++) {
      data['products[$i][id]'] = cartProducts[i].selectedStock?.id;
      data['products[$i][quantity]'] = cartProducts[i].quantity;
    }
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/calculate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ProductCalculateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get all calculations failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProductsPaginateResponse>> getProductsByIds(
    List<int> ids,
  ) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    for (int i = 0; i < ids.length; i++) {
      data['products[$i]'] = ids[i];
    }
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/ids',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ProductsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get products by ids failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<void>> addReview(
    String productUuid,
    String comment,
    double rating,
    String? imageUrl,
  ) async {
    final data = {
      'rating': rating,
      'comment': comment,
      if (imageUrl != null) 'images': [imageUrl],
    };
    debugPrint('===> add review data: $data');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client.post(
        '/api/v1/rest/products/review/$productUuid',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> add review failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProductsPaginateResponse>> getNewProducts({
    int? shopId,
    int? brandId,
    int? categoryId,
    int? page,
  }) async {
    final data = {
      if (shopId != null) 'shop_id': shopId,
      if (brandId != null) 'brand_id': brandId,
      if (categoryId != null) 'category_id': categoryId,
      if (page != null) 'page': page,
      'sort': 'desc',
      'column': 'created_at',
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'perPage': 14,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ProductsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get new products failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProductsPaginateResponse>> getDiscountProducts({
    int? shopId,
    int? brandId,
    int? categoryId,
    int? page,
  }) async {
    final data = {
      if (shopId != null) 'shop_id': shopId,
      if (brandId != null) 'brand_id': brandId,
      if (categoryId != null) 'category_id': categoryId,
      if (page != null) 'page': page,
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'perPage': 14,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/discount',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ProductsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get discount products failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProductsPaginateResponse>> getProfitableProducts({
    int? brandId,
    int? categoryId,
    int? page,
  }) async {
    final data = {
      if (brandId != null) 'brand_id': brandId,
      if (categoryId != null) 'category_id': categoryId,
      if (page != null) 'page': page,
      //'profitable': true,
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'perPage': 14,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/discount',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ProductsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get profitable products failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<AllProductsPaginateResponse>> getAllProducts({
    int? page = 1,
  }) async {
    final data = {
      'page': page,
      'perPage': 3,
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/categories/product/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: AllProductsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get discount products failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
