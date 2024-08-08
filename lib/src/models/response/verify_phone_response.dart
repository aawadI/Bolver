import '../data/user_data.dart';

class VerifyPhoneResponse {
  VerifyPhoneResponse({
    String? timestamp,
    bool? status,
    String? message,
    VerifyData? data,
  }) {
    _timestamp = timestamp;
    _status = status;
    _message = message;
    _data = data;
  }

  VerifyPhoneResponse.fromJson(dynamic json) {
    _timestamp = json['timestamp'];
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? VerifyData.fromJson(json['data']) : null;
  }

  String? _timestamp;
  bool? _status;
  String? _message;
  VerifyData? _data;

  VerifyPhoneResponse copyWith({
    String? timestamp,
    bool? status,
    String? message,
    VerifyData? data,
  }) =>
      VerifyPhoneResponse(
        timestamp: timestamp ?? _timestamp,
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  String? get timestamp => _timestamp;

  bool? get status => _status;

  String? get message => _message;

  VerifyData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['timestamp'] = _timestamp;
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class VerifyData {
  VerifyData({String? token, UserData? user}) {
    _token = token;
    _user = user;
  }

  VerifyData.fromJson(dynamic json) {
    _token = json['token'];
    _user = json['user'] != null ? UserData.fromJson(json['user']) : null;
  }

  String? _token;
  UserData? _user;

  VerifyData copyWith({String? token, UserData? user}) =>
      VerifyData(token: token ?? _token, user: user ?? _user);

  String? get token => _token;

  UserData? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }
}
