class Metadata {
  int? _id;
  String? key;
  String? value;

  int? get id => this._id;

  Metadata({this.key, this.value});

  Metadata.fromJSON(dynamic json) {
    this._id = json['id'];
    this.key = json['key'];
    this.value = json['value'];
  }

  Map<String, dynamic> toMap() {
    return {
      // "id": this._id,
      "key": this.key,
      "value": this.value,
    };
  }
}
