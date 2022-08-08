class Refund {
  int? _id;
  String? _reason;
  String? _total;

  //getters
  int? get id => this._id;
  String? get reason => this._reason;
  String? get total => this._total;

  Refund.fromJSON(dynamic json) {
    this._id = json['id'];
    this._reason = json['reason'];
    this._total = json['total'];
  }
}
