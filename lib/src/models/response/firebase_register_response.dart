import '../data/user_data.dart';

class FirebaseResponse {
  FirebaseResponse({
    String? token,
    bool? status,
    String? message,
    UserData? data,
  }) {
    _token = token;
    _status = status;
    _message = message;
    _data = data;
  }

  FirebaseResponse.fromJson(dynamic json) {
    _token = json['data']['access_token'];
    _status = json['status'];
    _message = json['message'];
    _data = json['data']['user'] != null ? UserData.fromJson(json['data']['user']) : null;
  }

  String? _token;
  bool? _status;
  String? _message;
  UserData? _data;

  FirebaseResponse copyWith({
    String? token,
    bool? status,
    String? message,
    UserData? data,
  }) =>
      FirebaseResponse(
        token: token ?? _token,
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  String? get token => _token;

  bool? get status => _status;

  String? get message => _message;

  UserData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = _token;
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data']['user'] = _data?.toJson();
    }
    return map;
  }
}
