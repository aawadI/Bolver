import '../data/address_data.dart';
import '../data/meta.dart';

class AddressesResponse {
  AddressesResponse({
    Meta? meta,
    List<AddressData>? data,
  }) {
    _meta = meta;
    _data = data;
  }

  AddressesResponse.fromJson(dynamic json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(AddressData.fromJson(v));
      });
    }
  }

  Meta? _meta;
  List<AddressData>? _data;

  AddressesResponse copyWith({
    Meta? meta,
    List<AddressData>? data,
  }) =>
      AddressesResponse(
        meta: meta ?? _meta,
        data: data ?? _data,
      );

  Meta? get meta => _meta;

  List<AddressData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}