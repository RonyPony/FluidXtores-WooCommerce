class Img {
  int? id;
  String? name;
  String? src;
  DateTime? createdDate;
  DateTime? modifiedDate;
  String? alt;

  Img.fromJSON(dynamic json) {
    this.id = json['id'];
    this.name = json['name'];
    this.alt = json['alt'];
    this.src = json['src'];
    this.createdDate = _dtDecode(json['date_created']);
    this.modifiedDate = _dtDecode(json['date_modified']);
  }
}


DateTime? _dtDecode(String dt) {
  return (dt != null) ? DateTime.parse(dt) : null;
}
