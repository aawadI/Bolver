import 'package:image_picker/image_picker.dart';

import '../models/models.dart';
import '../core/handlers/handlers.dart';
import '../core/constants/constants.dart';

abstract class GalleryRepository {
  Future<ApiResult<GalleryUploadResponse>> uploadImage(
      XFile file,
      UploadType uploadType,
      );
}
