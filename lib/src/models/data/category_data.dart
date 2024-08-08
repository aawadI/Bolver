import 'translation.dart';

class CategoryData {
  CategoryData({
    int? id,
    int? categoryID,
    String? uuid,
    String? keywords,
    int? parentId,
    String? type,
    String? img,
    bool? active,
    bool? hasChildren,
    String? createdAt,
    String? updatedAt,
    Translation? translation,
    List<CategoryData>? children,
    ProductTypeId? productTypeId,
    num? weight,
  }) {
    _id = id;
    _categoryID = categoryID;
    _uuid = uuid;
    _keywords = keywords;
    _parentId = parentId;
    _type = type;
    _img = img;
    _active = active;
    _hasChildren = hasChildren;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _translation = translation;
    _children = children;
    _productTypeId = productTypeId;
    _weight = weight;
  }

  CategoryData.fromJson(dynamic json) {
    _id = json['id'];
    _categoryID = json['category_id'];
    _uuid = json['uuid'];
    _keywords = json['keywords'];
    _parentId = json['parent_id'];
    _type = json['type'];
    _img = json['img'];
    _active = json['active'];
    _hasChildren = json['has_children'] == null ? false : true;
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
    if (json['children'] != null) {
      _children = [];
      json['children'].forEach((v) {
        _children?.add(CategoryData.fromJson(v));
      });
    }
    _productTypeId = json['product_type_id'] != null
        ? ProductTypeId.fromJson(json['product_type_id'])
        : null;
    _weight = json['weight'];
  }

  int? _id;
  int? _categoryID;
  String? _uuid;
  String? _keywords;
  int? _parentId;
  String? _type;
  String? _img;
  bool? _active;
  bool? _hasChildren;
  String? _createdAt;
  String? _updatedAt;
  Translation? _translation;
  List<CategoryData>? _children;
  ProductTypeId? _productTypeId;
  num? _weight;

  CategoryData copyWith({
    int? id,
    int? categoryID,
    String? uuid,
    String? keywords,
    int? parentId,
    String? type,
    String? img,
    bool? active,
    bool? hasChildren,
    String? createdAt,
    String? updatedAt,
    Translation? translation,
    List<CategoryData>? children,
    ProductTypeId? productTypeId,
    num? weight,
  }) =>
      CategoryData(
        id: id ?? _id,
        categoryID: categoryID ?? _categoryID,
        uuid: uuid ?? _uuid,
        keywords: keywords ?? _keywords,
        parentId: parentId ?? _parentId,
        type: type ?? _type,
        img: img ?? _img,
        active: active ?? _active,
        hasChildren: hasChildren ?? _hasChildren,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        translation: translation ?? _translation,
        children: children ?? _children,
        productTypeId: productTypeId ?? _productTypeId,
        weight: weight ?? _weight,
      );

  int? get id => _id;

  int? get categoryID => _categoryID;

  String? get uuid => _uuid;

  String? get keywords => _keywords;

  int? get parentId => _parentId;

  String? get type => _type;

  String? get img => _img;

  bool? get active => _active;

  bool? get hasChildren => _hasChildren;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Translation? get translation => _translation;

  List<CategoryData>? get children => _children;

  ProductTypeId? get productTypeId => _productTypeId;

  num? get weight => _weight;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uuid'] = _uuid;
    map['keywords'] = _keywords;
    map['parent_id'] = _parentId;
    map['type'] = _type;
    map['img'] = _img;
    map['active'] = _active;
    map['hasChildren'] = _hasChildren;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    if (_children != null) {
      map['children'] = _children?.map((v) => v.toJson()).toList();
    }
    if (_productTypeId != null) {
      map['product_type_id'] = _productTypeId?.toJson();
    }
    map['weight'] = _weight;
    return map;
  }
}

class ProductTypeId {
  ProductTypeId({
    String? name,
    String? nameEn,
    int? id,
  }) {
    _name = name;
    _nameEn = nameEn;
    _id = id;
  }

  ProductTypeId.fromJson(dynamic json) {
    _name = json['name'];
    _nameEn = json['name_en'];
    _id = json['id'];
  }

  String? _name;
  String? _nameEn;
  int? _id;

  ProductTypeId copyWith({
    String? name,
    String? nameEn,
    int? id,
  }) =>
      ProductTypeId(
        name: name ?? _name,
        nameEn: nameEn ?? _nameEn,
        id: id ?? _id,
      );

  String? get name => _name;

  String? get nameEn => _nameEn;

  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['name_en'] = _nameEn;
    map['id'] = _id;
    return map;
  }
}
