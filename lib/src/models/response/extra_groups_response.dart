import '../data/extra_group.dart';

class ExtraGroupsResponse {
  ExtraGroupsResponse({List<ExtraGroup>? data}) {
    _data = data;
  }

  ExtraGroupsResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ExtraGroup.fromJson(v));
      });
    }
  }

  List<ExtraGroup>? _data;

  ExtraGroupsResponse copyWith({List<ExtraGroup>? data}) =>
      ExtraGroupsResponse(data: data ?? _data);

  List<ExtraGroup>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
