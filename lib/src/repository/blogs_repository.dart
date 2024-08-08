import '../models/models.dart';
import '../core/handlers/handlers.dart';

abstract class BlogsRepository {
  Future<ApiResult<BlogsPaginateResponse>> getBlogs(int page, String type);

  Future<ApiResult<BlogData>> getDetails(String type, String uuid,);

  Future<ApiResult<BlogDetailsResponse>> getBlogDetails(String uuid);
}
