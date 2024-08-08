import '../data/new_delivery_data.dart';

class DeliveryResponse {
  DeliveryResponse({List<NewDeliveryData>? data}) {
    _data = data;
  }

  DeliveryResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(NewDeliveryData.fromJson(v));
      });
    }
  }

  List<NewDeliveryData>? _data;

  DeliveryResponse copyWith({List<NewDeliveryData>? data}) =>
      DeliveryResponse(data: data ?? _data);

  List<NewDeliveryData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
