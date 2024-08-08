import '../data/category_data.dart';

class CategoryDetailsResponse {
  CategoryDetailsResponse({CategoryData? data}) {
    _data = data;
  }

  CategoryDetailsResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? CategoryData.fromJson(json['data']) : null;
  }

  CategoryData? _data;

  CategoryDetailsResponse copyWith({CategoryData? data}) =>
      CategoryDetailsResponse(data: data ?? _data);

  CategoryData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
