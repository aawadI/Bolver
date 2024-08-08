import '../models/models.dart';
import '../core/handlers/handlers.dart';
import '../models/response/all_products_paginate_response.dart';

abstract class ProductsRepository {
  Future<ApiResult<NewSearchResponse>> searchNewProducts({String? query});

  Future<ApiResult<ProductsPaginateResponse>> searchProducts({
    String? query,
    int? categoryId,
    int? brandId,
    int? shopId,
  });

  Future<ApiResult<SingleProductResponse>> getProductDetails(String uuid);

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
  });

  Future<ApiResult<ProductsPaginateResponse>> getMostSoldProducts({
    required int page,
    int? shopId,
    int? categoryId,
    int? brandId,
  });

  Future<ApiResult<ProductsPaginateResponse>> getRelatedProducts(
    int? brandId,
    int? shopId,
    int? categoryId,
  );

  Future<ApiResult<ProductCalculateResponse>> getProductCalculations(
    int stockId,
    int quantity,
  );

  Future<ApiResult<ProductCalculateResponse>> getAllCalculations(
    List<CartProductData> cartProducts,
  );

  Future<ApiResult<ProductsPaginateResponse>> getProductsByIds(
    List<int> ids,
  );

  Future<ApiResult<void>> addReview(
    String productUuid,
    String comment,
    double rating,
    String? imageUrl,
  );

  Future<ApiResult<ProductsPaginateResponse>> getNewProducts({
    int? shopId,
    int? brandId,
    int? categoryId,
    int? page,
  });

  Future<ApiResult<ProductsPaginateResponse>> getDiscountProducts({
    int? shopId,
    int? brandId,
    int? categoryId,
    int? page,
  });

  Future<ApiResult<ProductsPaginateResponse>> getProfitableProducts({
    int? brandId,
    int? categoryId,
    int? page,
  });

  Future<ApiResult<AllProductsPaginateResponse>> getAllProducts({
    int? page = 1,
  });
}
