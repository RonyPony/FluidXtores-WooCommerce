class RequestResponse {
  String message;
  String code;
  int statusCode;

  RequestResponse({this.message});

  /// Use this class to catch Error
  RequestResponse.fromJSON(dynamic json) {
    this.message = json['message'];
    this.code = json['code'];
    this.statusCode = json['statusCode'];
  }
}
