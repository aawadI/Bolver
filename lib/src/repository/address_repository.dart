import '../core/handlers/handlers.dart';
import '../models/models.dart';

abstract class AddressRepository {
  Future<ApiResult<AddressesResponse>> getUserAddresses({int pageCount = 0});

  Future<ApiResult<AddressData>> getShowAddress(int addressID);


  Future<ApiResult<void>> deleteAddress(int addressId);

  Future<ApiResult> createAddress(
      AddressData address,
      int? countryID,
      int? regionID,
      int? cityID,
      );

  Future<ApiResult> editAddress(
      AddressData address,
      int? addressID,
      );
}
