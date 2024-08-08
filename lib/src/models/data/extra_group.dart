import 'product_data.dart';
import 'translation.dart';

class ExtraGroup {
  ExtraGroup({
    int? id,
    String? type,
    bool? active,
    Translation? translation,
    List<Extras>? filterExtras,
  }) {
    _id = id;
    _type = type;
    _active = active;
    _translation = translation;
    _filterExtras = filterExtras;
  }

  ExtraGroup.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _active = json['active'];
    _translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
    _filterExtras = [];
  }

  int? _id;
  String? _type;
  bool? _active;
  Translation? _translation;
  List<Extras>? _filterExtras;

  ExtraGroup copyWith({
    int? id,
    String? type,
    bool? active,
    Translation? translation,
    List<Extras>? filterExtras,
  }) =>
      ExtraGroup(
        id: id ?? _id,
        type: type ?? _type,
        active: active ?? _active,
        translation: translation ?? _translation,
        filterExtras: filterExtras ?? _filterExtras,
      );

  int? get id => _id;

  String? get type => _type;

  bool? get active => _active;

  Translation? get translation => _translation;

  List<Extras>? get filterExtras => _filterExtras;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['active'] = _active;
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    return map;
  }
}
