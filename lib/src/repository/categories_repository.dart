import '../models/models.dart';
import '../core/handlers/handlers.dart';

abstract class CategoriesRepository {
  Future<ApiResult<ExtraGroupsResponse>> getExtraGroups();

  Future<ApiResult<FiltersResponse>> getCategoryFilters({int? categoryId});

  Future<ApiResult<CategoryDetailsResponse>> getCategoryDetails({String? uuid});

  Future<ApiResult<CategoriesPaginateResponse>> getAllCategories({bool? mostSold});
}
