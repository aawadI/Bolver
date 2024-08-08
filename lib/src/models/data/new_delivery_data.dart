import 'translation.dart';

class NewDeliveryData {
  NewDeliveryData({
    int? id,
    int? shopId,
    String? type,
    num? price,
    num? localPrice,
    List<String>? times,
    String? note,
    bool? active,
    String? createdAt,
    String? updatedAt,
    Translation? translation,
    List<Countries>? countries,
  }) {
    _id = id;
    _shopId = shopId;
    _type = type;
    _price = price;
    _localPrice = localPrice;
    _times = times;
    _note = note;
    _active = active;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _translation = translation;
    _countries = countries;
  }

  NewDeliveryData.fromJson(dynamic json) {
    _id = json['id'];
    _shopId = json['shop_id'];
    _type = json['type'];
    _price = json['price'];
    _localPrice = json['price'];
    _times = json['times'] != null ? json['times'].cast<String>() : [];
    _note = json['note'];
    _active = json['active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
    if (json['countries'] != null) {
      _countries = [];
      json['countries'].forEach((v) {
        _countries?.add(Countries.fromJson(v));
      });
    }
  }

  int? _id;
  int? _shopId;
  String? _type;
  num? _price;
  num? _localPrice;
  List<String>? _times;
  String? _note;
  bool? _active;
  String? _createdAt;
  String? _updatedAt;
  Translation? _translation;
  List<Countries>? _countries;

  NewDeliveryData copyWith({
    int? id,
    int? shopId,
    String? type,
    num? price,
    num? localPrice,
    List<String>? times,
    String? note,
    bool? active,
    String? createdAt,
    String? updatedAt,
    Translation? translation,
    List<Countries>? countries,
  }) =>
      NewDeliveryData(
        id: id ?? _id,
        shopId: shopId ?? _shopId,
        type: type ?? _type,
        price: price ?? _price,
        localPrice: localPrice ?? _localPrice,
        times: times ?? _times,
        note: note ?? _note,
        active: active ?? _active,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        translation: translation ?? _translation,
        countries: countries ?? _countries,
      );

  int? get id => _id;

  int? get shopId => _shopId;

  String? get type => _type;

  num? get price => _price;

  num? get localPrice => _localPrice;

  List<String>? get times => _times;

  String? get note => _note;

  bool? get active => _active;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Translation? get translation => _translation;

  List<Countries>? get countries => _countries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['shop_id'] = _shopId;
    map['type'] = _type;
    map['price'] = _price;
    map['times'] = _times;
    map['note'] = _note;
    map['active'] = _active;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    if (_countries != null) {
      map['countries'] = _countries?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Countries {
  Countries({
    int? id,
    num? price,
    Translation? translation,
  }) {
    _id = id;
    _price = price;
    _translation = translation;
  }

  Countries.fromJson(dynamic json) {
    _id = json['id'];
    _price = json['price'];
    _translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
  }

  int? _id;
  num? _price;
  Translation? _translation;

  Countries copyWith({
    int? id,
    num? price,
    Translation? translation,
  }) =>
      Countries(
        id: id ?? _id,
        price: price ?? _price,
        translation: translation ?? _translation,
      );

  int? get id => _id;

  num? get price => _price;

  Translation? get translation => _translation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['price'] = _price;
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    return map;
  }
}