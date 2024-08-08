import 'package:g_customer/src/models/data/translation.dart';
import 'package:g_customer/src/models/models.dart';

class AllProductData {
  AllProductData({
    List<ProductData>? product,
    Translation? translation,
    int? parentID,
    String? img,
    String? uuid,
  }) {
    _product = product;
    _translation = translation;
    _parentID = parentID;
    _img = img;
    _uuid = uuid;
  }

  AllProductData.fromJson(dynamic json) {
    if (json['products'] != null) {
      _product = [];
      json['products'].forEach((v) {
        _product?.add(ProductData.fromJson(v));
      });
    }
    _translation = json['translation'] != null ? Translation.fromJson(json['translation']) : null;
    _parentID = json['parent_id'];
    _img = json['img'];
    _uuid = json['uuid'];
  }

  List<ProductData>? _product;
  Translation? _translation;
  int? _parentID;
  String? _img;
  String? _uuid;

  AllProductData copyWith({
    List<ProductData>? data,
    Translation? translation,
    int? id,
    String? img,
    String? uuid,
  }) =>
      AllProductData(
        product: product ?? _product,
        translation: translation ?? _translation,
          parentID: parentID ?? _parentID,
        img: img ?? _img,
        uuid: uuid ?? _uuid
      );

  List<ProductData>? get product => _product;

  Translation? get translation => _translation;

  int? get parentID => _parentID;

  String? get img => _img;

  String? get uuid => _uuid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_product != null) {
      map['products'] = _product?.map((v) => v.toJson()).toList();
    }
    // if (_links != null) {
    //   map['links'] = _links?.toJson();
    // }
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    return map;
  }
}