class Tags {
  int id;
  String name;
  String slug;
  String link;

  Tags({this.id, this.name, this.slug, this.link});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['link'] = this.link;
    return data;
  }
}
