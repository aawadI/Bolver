import '../data/meta.dart';
import '../data/brand_data.dart';

class BrandsPaginateResponse {
  BrandsPaginateResponse({List<BrandData>? data, Meta? meta}) {
    _data = data;
    _meta = meta;
  }

  BrandsPaginateResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(BrandData.fromJson(v));
      });
    }
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  List<BrandData>? _data;
  Meta? _meta;

  BrandsPaginateResponse copyWith({List<BrandData>? data, Meta? meta}) =>
      BrandsPaginateResponse(data: data ?? _data, meta: meta ?? _meta);

  List<BrandData>? get data => _data;

  Meta? get meta => _meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    return map;
  }
}
