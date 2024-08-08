import '../models/models.dart';
import '../core/handlers/handlers.dart';

abstract class SettingsRepository {
  Future<ApiResult<GlobalSettingsResponse>> getGlobalSettings();

  Future<ApiResult<MobileTranslationsResponse>> getMobileTranslations();

  Future<ApiResult<LanguagesResponse>> getLanguages();
}
