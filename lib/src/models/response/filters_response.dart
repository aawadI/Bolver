import '../data/shop_data.dart';
import '../data/brand_data.dart';
import '../data/category_data.dart';

class FiltersResponse {
  FiltersResponse({
    List<CategoryData>? categories,
    List<ShopData>? shops,
    List<BrandData>? brands,
    Map<String, dynamic>? extraValues,
    num? minPrice,
    num? maxPrice,
  }) {
    _categories = categories;
    _shops = shops;
    _brands = brands;
    _extraValues = extraValues;
    _minPrice = minPrice;
    _maxPrice = maxPrice;
  }

  FiltersResponse.fromJson(dynamic json) {
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(CategoryData.fromJson(v));
      });
    }
    if (json['shops'] != null) {
      _shops = [];
      json['shops'].forEach((v) {
        _shops?.add(ShopData.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      _brands = [];
      json['brands'].forEach((v) {
        _brands?.add(BrandData.fromJson(v));
      });
    }
    _extraValues = json['extraValues'];
    _minPrice = json['min_price'];
    _maxPrice = json['max_price'];
  }

  List<CategoryData>? _categories;
  List<ShopData>? _shops;
  List<BrandData>? _brands;
  Map<String, dynamic>? _extraValues;
  num? _minPrice;
  num? _maxPrice;

  FiltersResponse copyWith({
    List<CategoryData>? categories,
    List<ShopData>? shops,
    List<BrandData>? brands,
    Map<String, dynamic>? extraValues,
    num? minPrice,
    num? maxPrice,
  }) =>
      FiltersResponse(
        categories: categories ?? _categories,
        shops: shops ?? _shops,
        brands: brands ?? _brands,
        extraValues: extraValues ?? _extraValues,
        minPrice: minPrice ?? _minPrice,
        maxPrice: maxPrice ?? _maxPrice,
      );

  List<CategoryData>? get categories => _categories;

  List<ShopData>? get shops => _shops;

  List<BrandData>? get brands => _brands;

  Map<String, dynamic>? get extraValues => _extraValues;

  num? get minPrice => _minPrice;

  num? get maxPrice => _maxPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    if (_shops != null) {
      map['shops'] = _shops?.map((v) => v.toJson()).toList();
    }
    if (_brands != null) {
      map['brands'] = _brands?.map((v) => v.toJson()).toList();
    }
    map['extraValues'] = _extraValues;
    map['min_price'] = _minPrice;
    map['max_price'] = _maxPrice;
    return map;
  }
}
