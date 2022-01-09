class FluidXstoreMedia {
  int id;
  String date;
  String dateGmt;
  Guid guid;
  String modified;
  String modifiedGmt;
  String slug;
  String status;
  String type;
  String link;
  Guid title;
  int author;
  String commentStatus;
  String pingStatus;
  String template;
  List<String> meta;
  Guid description;
  Guid caption;
  String altText;
  String mediaType;
  String mimeType;
  MediaDetails mediaDetails;
  int post;
  String sourceUrl;
  Links lLinks;

  FluidXstoreMedia(
      {this.id,
      this.date,
      this.dateGmt,
      this.guid,
      this.modified,
      this.modifiedGmt,
      this.slug,
      this.status,
      this.type,
      this.link,
      this.title,
      this.author,
      this.commentStatus,
      this.pingStatus,
      this.template,
      this.meta,
      this.description,
      this.caption,
      this.altText,
      this.mediaType,
      this.mimeType,
      this.mediaDetails,
      this.post,
      this.sourceUrl,
      this.lLinks});

  FluidXstoreMedia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    guid = json['guid'] != null ? new Guid.fromJson(json['guid']) : null;
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    slug = json['slug'];
    status = json['status'];
    type = json['type'];
    link = json['link'];
    title = json['title'] != null ? new Guid.fromJson(json['title']) : null;
    author = json['author'];
    commentStatus = json['comment_status'];
    pingStatus = json['ping_status'];
    template = json['template'];
    if (json['meta'] != null) {
      meta = new List<Null>();
      json['meta'].forEach((v) {
        meta.add(v);
      });
    }
    description = json['description'] != null
        ? new Guid.fromJson(json['description'])
        : null;
    caption =
        json['caption'] != null ? new Guid.fromJson(json['caption']) : null;
    altText = json['alt_text'];
    mediaType = json['media_type'];
    mimeType = json['mime_type'];
    mediaDetails = json['media_details'] != null
        ? new MediaDetails.fromJson(json['media_details'])
        : null;
    post = json['post'];
    sourceUrl = json['source_url'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['date_gmt'] = this.dateGmt;
    if (this.guid != null) {
      data['guid'] = this.guid.toJson();
    }
    data['modified'] = this.modified;
    data['modified_gmt'] = this.modifiedGmt;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['type'] = this.type;
    data['link'] = this.link;
    if (this.title != null) {
      data['title'] = this.title.toJson();
    }
    data['author'] = this.author;
    data['comment_status'] = this.commentStatus;
    data['ping_status'] = this.pingStatus;
    data['template'] = this.template;
    if (this.meta != null) {
      data['meta'] = this.meta.map((v) => v).toList();
    }
    if (this.description != null) {
      data['description'] = this.description.toJson();
    }
    if (this.caption != null) {
      data['caption'] = this.caption.toJson();
    }
    data['alt_text'] = this.altText;
    data['media_type'] = this.mediaType;
    data['mime_type'] = this.mimeType;
    if (this.mediaDetails != null) {
      data['media_details'] = this.mediaDetails.toJson();
    }
    data['post'] = this.post;
    data['source_url'] = this.sourceUrl;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}

class Guid {
  String rendered;

  Guid({this.rendered});

  Guid.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = this.rendered;
    return data;
  }
}

class MediaDetails {
  int width;
  int height;
  String file;
  Sizes sizes;
  ImageMeta imageMeta;

  MediaDetails(
      {this.width, this.height, this.file, this.sizes, this.imageMeta});

  MediaDetails.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    file = json['file'];
    sizes = json['sizes'] != null ? new Sizes.fromJson(json['sizes']) : null;
    imageMeta = json['image_meta'] != null
        ? new ImageMeta.fromJson(json['image_meta'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
    data['file'] = this.file;
    if (this.sizes != null) {
      data['sizes'] = this.sizes.toJson();
    }
    if (this.imageMeta != null) {
      data['image_meta'] = this.imageMeta.toJson();
    }
    return data;
  }
}

class Sizes {
  Medium medium;
  Medium thumbnail;
  WoocommerceThumbnail woocommerceThumbnail;
  Medium woocommerceSingle;
  Medium woocommerceGalleryThumbnail;
  Medium shopCatalog;
  Medium shopSingle;
  Medium shopThumbnail;
  Medium full;

  Sizes(
      {this.medium,
      this.thumbnail,
      this.woocommerceThumbnail,
      this.woocommerceSingle,
      this.woocommerceGalleryThumbnail,
      this.shopCatalog,
      this.shopSingle,
      this.shopThumbnail,
      this.full});

  Sizes.fromJson(Map<String, dynamic> json) {
    medium =
        json['medium'] != null ? new Medium.fromJson(json['medium']) : null;
    thumbnail = json['thumbnail'] != null
        ? new Medium.fromJson(json['thumbnail'])
        : null;
    woocommerceThumbnail = json['woocommerce_thumbnail'] != null
        ? new WoocommerceThumbnail.fromJson(json['woocommerce_thumbnail'])
        : null;
    woocommerceSingle = json['woocommerce_single'] != null
        ? new Medium.fromJson(json['woocommerce_single'])
        : null;
    woocommerceGalleryThumbnail = json['woocommerce_gallery_thumbnail'] != null
        ? new Medium.fromJson(json['woocommerce_gallery_thumbnail'])
        : null;
    shopCatalog = json['shop_catalog'] != null
        ? new Medium.fromJson(json['shop_catalog'])
        : null;
    shopSingle = json['shop_single'] != null
        ? new Medium.fromJson(json['shop_single'])
        : null;
    shopThumbnail = json['shop_thumbnail'] != null
        ? new Medium.fromJson(json['shop_thumbnail'])
        : null;
    full = json['full'] != null ? new Medium.fromJson(json['full']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.medium != null) {
      data['medium'] = this.medium.toJson();
    }
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    if (this.woocommerceThumbnail != null) {
      data['woocommerce_thumbnail'] = this.woocommerceThumbnail.toJson();
    }
    if (this.woocommerceSingle != null) {
      data['woocommerce_single'] = this.woocommerceSingle.toJson();
    }
    if (this.woocommerceGalleryThumbnail != null) {
      data['woocommerce_gallery_thumbnail'] =
          this.woocommerceGalleryThumbnail.toJson();
    }
    if (this.shopCatalog != null) {
      data['shop_catalog'] = this.shopCatalog.toJson();
    }
    if (this.shopSingle != null) {
      data['shop_single'] = this.shopSingle.toJson();
    }
    if (this.shopThumbnail != null) {
      data['shop_thumbnail'] = this.shopThumbnail.toJson();
    }
    if (this.full != null) {
      data['full'] = this.full.toJson();
    }
    return data;
  }
}

class Medium {
  String file;
  int width;
  int height;
  String mimeType;
  String sourceUrl;

  Medium({this.file, this.width, this.height, this.mimeType, this.sourceUrl});

  Medium.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    width = json['width'];
    height = json['height'];
    mimeType = json['mime_type'];
    sourceUrl = json['source_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    data['width'] = this.width;
    data['height'] = this.height;
    data['mime_type'] = this.mimeType;
    data['source_url'] = this.sourceUrl;
    return data;
  }
}

class WoocommerceThumbnail {
  String file;
  int width;
  int height;
  bool uncropped;
  String mimeType;
  String sourceUrl;

  WoocommerceThumbnail(
      {this.file,
      this.width,
      this.height,
      this.uncropped,
      this.mimeType,
      this.sourceUrl});

  WoocommerceThumbnail.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    width = json['width'];
    height = json['height'];
    uncropped = json['uncropped'];
    mimeType = json['mime_type'];
    sourceUrl = json['source_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    data['width'] = this.width;
    data['height'] = this.height;
    data['uncropped'] = this.uncropped;
    data['mime_type'] = this.mimeType;
    data['source_url'] = this.sourceUrl;
    return data;
  }
}

class ImageMeta {
  String aperture;
  String credit;
  String camera;
  String caption;
  String createdTimestamp;
  String copyright;
  String focalLength;
  String iso;
  String shutterSpeed;
  String title;
  String orientation;
  List<String> keywords;

  ImageMeta(
      {this.aperture,
      this.credit,
      this.camera,
      this.caption,
      this.createdTimestamp,
      this.copyright,
      this.focalLength,
      this.iso,
      this.shutterSpeed,
      this.title,
      this.orientation,
      this.keywords});

  ImageMeta.fromJson(Map<String, dynamic> json) {
    aperture = json['aperture'];
    credit = json['credit'];
    camera = json['camera'];
    caption = json['caption'];
    createdTimestamp = json['created_timestamp'];
    copyright = json['copyright'];
    focalLength = json['focal_length'];
    iso = json['iso'];
    shutterSpeed = json['shutter_speed'];
    title = json['title'];
    orientation = json['orientation'];
    if (json['keywords'] != null) {
      keywords = new List<Null>();
      json['keywords'].forEach((v) {
        keywords.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aperture'] = this.aperture;
    data['credit'] = this.credit;
    data['camera'] = this.camera;
    data['caption'] = this.caption;
    data['created_timestamp'] = this.createdTimestamp;
    data['copyright'] = this.copyright;
    data['focal_length'] = this.focalLength;
    data['iso'] = this.iso;
    data['shutter_speed'] = this.shutterSpeed;
    data['title'] = this.title;
    data['orientation'] = this.orientation;
    if (this.keywords != null) {
      data['keywords'] = this.keywords.map((v) => v).toList();
    }
    return data;
  }
}

class Links {
  List<Self> self;
  List<String> collection;
  List<String> about;
  List<Author> author;
  List<String> replies;

  Links({this.self, this.collection, this.about, this.author, this.replies});

  Links.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = new List<Self>();
      json['self'].forEach((v) {
        self.add(new Self.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection = new List<String>();
      json['collection'].forEach((v) {
        collection.add(v);
      });
    }
    if (json['about'] != null) {
      about = new List<String>();
      json['about'].forEach((v) {
        about.add(v);
      });
    }
    if (json['author'] != null) {
      author = new List<Author>();
      json['author'].forEach((v) {
        author.add(new Author.fromJson(v));
      });
    }
    if (json['replies'] != null) {
      replies = new List<String>();
      json['replies'].forEach((v) {
        replies.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self.map((v) => v.toJson()).toList();
    }
    if (this.collection != null) {
      data['collection'] = this.collection.map((v) => v).toList();
    }
    if (this.about != null) {
      data['about'] = this.about.map((v) => v).toList();
    }
    if (this.author != null) {
      data['author'] = this.author.map((v) => v.toJson()).toList();
    }
    if (this.replies != null) {
      data['replies'] = this.replies.map((v) => v).toList();
    }
    return data;
  }
}

class Self {
  String href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Author {
  bool embeddable;
  String href;

  Author({this.embeddable, this.href});

  Author.fromJson(Map<String, dynamic> json) {
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['embeddable'] = this.embeddable;
    data['href'] = this.href;
    return data;
  }
}
