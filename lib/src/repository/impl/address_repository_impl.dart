import 'dart:developer';
import 'package:flutter/material.dart';
import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';
import '../../models/models.dart';
import '../repository.dart';

class AddressRepositoryImpl extends AddressRepository {
  @override
  Future<ApiResult<AddressesResponse>> getUserAddresses({int pageCount = 0}) async {
    final data = {
      'perPage': 10,
      'page': pageCount
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/addresses',
        queryParameters: data,);
      log('===> getting address data: ${response.data}');
      return ApiResult.success(
        data: AddressesResponse.fromJson(response.data),
      );
    } catch (e , s) {
      debugPrint('==> get addresses failure: $e');
      debugPrint('==> get addresses failure: $s');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<AddressData>> getShowAddress(int addressID) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
          '/api/v1/dashboard/user/addresses/$addressID');
      log('===> getting address data: ${response.data}');
      return ApiResult.success(
        data: AddressData.fromJson(response.data['data']),
      );
    } catch (e , s) {
      debugPrint('==> get Show addresses failure: $e');
      debugPrint('==> get Show addresses failure: $s');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<void>> deleteAddress(int addressId) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client.delete('/api/v1/dashboard/user/addresses/$addressId');
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> delete address failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> createAddress(
      AddressData address,
      int? countryID,
      int? regionID,
      int? cityID,
      ) async {
    final data = {
      'address': address.address,
      'location':
      '${address.localLocation?.latitude},${address.localLocation?.longitude}',
      'active': 1,
      'title': address.title,
      'default': (address.isSelected ?? false) ? 1 : 0,
      'country_id': countryID,
      'region_id': regionID,
      'city_id' : cityID
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/user/addresses',
        data: data,
      );
      return const ApiResult.success(
        data: null,
      );
    } catch (e , s) {
      debugPrint('==> create address failure: $e');
      debugPrint('==> create address failure: $s');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> editAddress(
      AddressData address,
      int? addressID,
      ) async {
    final data = {
      'address': address.address,
      'location':
      '${address.localLocation?.latitude},${address.localLocation?.longitude}',
      'active': 1,
      'title': address.title,
      'default': (address.isSelected ?? false) ? 1 : 0,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client.put(
        '/api/v1/dashboard/user/addresses/$addressID',
        data: data,
      );
      return const ApiResult.success(
        data: null,
      );
    } catch (e , s) {
      debugPrint('==> edit address failure: $e');
      debugPrint('==> edit address failure: $s');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
