import '../data/all_product_data.dart';
import '../data/meta.dart';

class AllProductsPaginateResponse {
  AllProductsPaginateResponse({
    List<AllProductData>? data,
    // Links? links,
    Meta? meta,
  }) {
    _data = data;
    // _links = links;
    _meta = meta;
  }

  AllProductsPaginateResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(AllProductData.fromJson(v));
      });
    }
    // _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  List<AllProductData>? _data;
  // Links? _links;
  Meta? _meta;

  AllProductsPaginateResponse copyWith({
    List<AllProductData>? data,
    // Links? links,
    Meta? meta,
  }) =>
      AllProductsPaginateResponse(
        data: data ?? _data,
        // links: links ?? _links,
        meta: meta ?? _meta,
      );

  List<AllProductData>? get data => _data;

  // Links? get links => _links;

  Meta? get meta => _meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    // if (_links != null) {
    //   map['links'] = _links?.toJson();
    // }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    return map;
  }
}