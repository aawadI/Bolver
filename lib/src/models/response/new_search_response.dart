import '../data/shop_data.dart';
import '../data/brand_data.dart';
import '../data/product_data.dart';
import '../data/category_data.dart';

class NewSearchResponse {
  NewSearchResponse({
    List<CategoryData>? categories,
    List<BrandData>? brands,
    List<ProductData>? products,
    List<ShopData>? shops,
  }) {
    _categories = categories;
    _brands = brands;
    _products = products;
    _shops = shops;
  }

  NewSearchResponse.fromJson(dynamic json) {
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(CategoryData.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      _brands = [];
      json['brands'].forEach((v) {
        _brands?.add(BrandData.fromJson(v));
      });
    }
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(ProductData.fromJson(v));
      });
    }
    if (json['shops'] != null) {
      _shops = [];
      json['shops'].forEach((v) {
        _shops?.add(ShopData.fromJson(v));
      });
    }
  }

  List<CategoryData>? _categories;
  List<BrandData>? _brands;
  List<ProductData>? _products;
  List<ShopData>? _shops;

  NewSearchResponse copyWith({
    List<CategoryData>? categories,
    List<BrandData>? brands,
    List<ProductData>? products,
    List<ShopData>? shops,
  }) =>
      NewSearchResponse(
        categories: categories ?? _categories,
        brands: brands ?? _brands,
        products: products ?? _products,
        shops: shops ?? _shops,
      );

  List<CategoryData>? get categories => _categories;

  List<BrandData>? get brands => _brands;

  List<ProductData>? get products => _products;

  List<ShopData>? get shops => _shops;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    if (_brands != null) {
      map['brands'] = _brands?.map((v) => v.toJson()).toList();
    }
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    if (_shops != null) {
      map['shops'] = _shops?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
