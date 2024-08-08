import '../models/models.dart';
import '../core/handlers/handlers.dart';

abstract class BrandsRepository {
  Future<ApiResult<BrandsPaginateResponse>> getBrandsPaginate(
    int page, {
    int? shopId,
  });

  Future<ApiResult<BrandsPaginateResponse>> searchBrands(String query);

  Future<ApiResult<SingleBrandResponse>> getSingleBrand(int? id);

  Future<ApiResult<BrandsPaginateResponse>> getAllBrands({bool? mostSold});
}
