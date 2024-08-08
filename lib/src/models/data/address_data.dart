import '../models.dart';
class AddressData {
  AddressData({
    int? id,
    String? title,
    String? address,
    Location? location,
    bool? isDefault,
    bool? isSelected,
    bool? active,
    LocalLocation? localLocation,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _title = title;
    _address = address;
    _location = location;
    _default = isDefault;
    _isSelected = isSelected;
    _active = active;
    _localLocation = localLocation;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  AddressData.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _address = json['address'];
    _location =
    json['location'] != null ? Location.fromJson(json['location']) : null;
    _default = json['default'];
    _isSelected = false;
    _active = json['active'];
    _localLocation = json['location'] != null
        ? LocalLocation.fromJson(json['location'])
        : null;
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  String? _title;
  String? _address;
  Location? _location;
  bool? _default;
  bool? _isSelected;
  bool? _active;
  LocalLocation? _localLocation;
  String? _createdAt;
  String? _updatedAt;

  AddressData copyWith({
    int? id,
    AddressValue? countryID,
    AddressValue? regionID,
    AddressValue? cityID,
    String? title,
    String? address,
    Location? location,
    bool? isDefault,
    bool? isSelected,
    bool? active,
    LocalLocation? localLocation,
    String? createdAt,
    String? updatedAt,
  }) =>
      AddressData(
        id: id ?? _id,
        title: title ?? _title,
        address: address ?? _address,
        location: location ?? _location,
        isDefault: isDefault ?? _default,
        isSelected: isSelected ?? _isSelected,
        active: active ?? _active,
        localLocation: localLocation ?? _localLocation,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  int? get id => _id;

  String? get title => _title;

  String? get address => _address;

  Location? get location => _location;

  bool? get isDefault => _default;

  bool? get isSelected => _isSelected;

  bool? get active => _active;

  LocalLocation? get localLocation => _localLocation;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['address'] = _address;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['default'] = _default;
    map['active'] = _active;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

class AddressValue {
  AddressValue({int? id, String? name}) {
    _id = id;
    _name = name;
  }

  AddressValue.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }

  int? _id;
  String? _name;

  AddressValue copyWith({int? id, String? name}) =>
      AddressValue(
        id: id ?? _id,
        name: name ?? _name,
      );

  int? get id => _id;

  String? get name => _name;

}