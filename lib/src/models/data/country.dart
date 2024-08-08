class Country {
  Country({int? id, CountryDelivery? delivery}) {
    _id = id;
    _delivery = delivery;
  }

  Country.fromJson(dynamic json) {
    _id = json['id'];
    _delivery = json['delivery'] != null
        ? CountryDelivery.fromJson(json['delivery'])
        : null;
  }

  int? _id;
  CountryDelivery? _delivery;

  Country copyWith({int? id, CountryDelivery? delivery}) =>
      Country(id: id ?? _id, delivery: delivery ?? _delivery);

  int? get id => _id;

  CountryDelivery? get delivery => _delivery;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_delivery != null) {
      map['delivery'] = _delivery?.toJson();
    }
    return map;
  }
}

class CountryDelivery {
  CountryDelivery({
    int? id,
    int? countryId,
    int? deliveryId,
    num? price,
    String? updatedAt,
  }) {
    _id = id;
    _countryId = countryId;
    _deliveryId = deliveryId;
    _price = price;
    _updatedAt = updatedAt;
  }

  CountryDelivery.fromJson(dynamic json) {
    _id = json['id'];
    _countryId = json['country_id'];
    _deliveryId = json['delivery_id'];
    _price = json['price'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  int? _countryId;
  int? _deliveryId;
  num? _price;
  String? _updatedAt;

  CountryDelivery copyWith({
    int? id,
    int? countryId,
    int? deliveryId,
    num? price,
    String? updatedAt,
  }) =>
      CountryDelivery(
        id: id ?? _id,
        countryId: countryId ?? _countryId,
        deliveryId: deliveryId ?? _deliveryId,
        price: price ?? _price,
        updatedAt: updatedAt ?? _updatedAt,
      );

  int? get id => _id;

  int? get countryId => _countryId;

  int? get deliveryId => _deliveryId;

  num? get price => _price;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['country_id'] = _countryId;
    map['delivery_id'] = _deliveryId;
    map['price'] = _price;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
