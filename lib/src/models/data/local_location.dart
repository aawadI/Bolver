class LocalLocation {
  LocalLocation({num? latitude, num? longitude}) {
    _latitude = latitude;
    _longitude = longitude;
  }

  LocalLocation.fromJson(dynamic json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }

  num? _latitude;
  num? _longitude;

  LocalLocation copyWith({num? latitude, num? longitude}) =>
      LocalLocation(
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
      );

  num? get latitude => _latitude;

  num? get longitude => _longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    return map;
  }
}
