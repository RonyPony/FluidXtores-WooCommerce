class CategoryItem {
  int id;
  String name;
  String slug;
  String description;
  int parent;
  int count;
  Image image;
  int reviewCount;
  String permalink;

  CategoryItem(
      {this.id,
      this.name,
      this.slug,
      this.description,
      this.parent,
      this.count,
      this.image,
      this.reviewCount,
      this.permalink});

  CategoryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    parent = json['parent'];
    count = json['count'];
    image = json['image'] != null
        ? Image(
            src: json['image']['src'],
            alt: json['image']['alt'],
            id: json['image']['id'],
            name: json['image']['name'],
            sizes: json['image']['sized'])
        : null;
    reviewCount = json['review_count'];
    permalink = json['permalink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['parent'] = this.parent;
    data['count'] = this.count;
    data['image'] = this.image;
    data['review_count'] = this.reviewCount;
    data['permalink'] = this.permalink;
    return data;
  }
}

class Image {
  String src;
  String thumbnail;
  String srcset;
  String sizes;
  String name;
  String alt;
  int id;

  Image(
      {this.src,
      this.thumbnail,
      this.srcset,
      this.id,
      this.alt,
      this.name,
      this.sizes});

  Image.fromJson(Map<String, dynamic> json) {
    src = json['src'];
    thumbnail = json['thumbnail'];
    srcset = json['srcset'];
    id = json['id'];
    sizes = json['sizes'];
    name = json['name'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['src'] = this.src;
    data['thumbnail'] = this.thumbnail;
    data['srcset'] = this.srcset;
    data['id'] = this.id;
    data['sizes'] = this.sizes;
    data['name'] = this.name;
    data['alt'] = this.alt;
    return data;
  }
}
