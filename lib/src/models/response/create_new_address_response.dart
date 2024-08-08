import '../data/address_data.dart';

class CreateNewAddressResponse {
  CreateNewAddressResponse({AddressData? data}) {
    _data = data;
  }

  CreateNewAddressResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? AddressData.fromJson(json['data']) : null;
  }

  AddressData? _data;

  CreateNewAddressResponse copyWith({AddressData? data}) =>
      CreateNewAddressResponse(data: data ?? _data);

  AddressData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
