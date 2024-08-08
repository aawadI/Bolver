class AtbPaymentResponse {
  AtbPaymentResponse({String? url}) {
    _url = url;
  }

  AtbPaymentResponse.fromJson(dynamic json) {
    _url = json['data'];
  }

  String? _url;

  AtbPaymentResponse copyWith({String? url}) =>
      AtbPaymentResponse(url: url ?? _url);

  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = _url;
    return map;
  }
}
