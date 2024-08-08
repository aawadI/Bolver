import '../models/models.dart';
import '../core/handlers/handlers.dart';

abstract class CurrenciesRepository {
  Future<ApiResult<CurrenciesResponse>> getCurrencies();
}
