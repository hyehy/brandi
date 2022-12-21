class ImageModel {
  Meta? meta;
  List<Documents>? documents;

  ImageModel({this.meta, this.documents});

  ImageModel.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(Documents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    if (this.documents != null) {
      data['documents'] = this.documents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  int? totalCount;
  int? pageableCount;
  bool? isEnd;

  Meta({this.totalCount, this.pageableCount, this.isEnd});

  Meta.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    pageableCount = json['pageable_count'];
    isEnd = json['is_end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    data['pageable_count'] = this.pageableCount;
    data['is_end'] = this.isEnd;
    return data;
  }
}

class Documents {
  String? collection;
  String? thumbnailUrl;
  String? imageUrl;
  int? width;
  int? height;
  String? displaySitename;
  String? docUrl;
  String? datetime;

  Documents(
      {this.collection,
        this.thumbnailUrl,
        this.imageUrl,
        this.width,
        this.height,
        this.displaySitename,
        this.docUrl,
        this.datetime});

  Documents.fromJson(Map<String, dynamic> json) {
    collection = json['collection'];
    thumbnailUrl = json['thumbnail_url'];
    imageUrl = json['image_url'];
    width = json['width'];
    height = json['height'];
    displaySitename = json['display_sitename'];
    docUrl = json['doc_url'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collection'] = this.collection;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['image_url'] = this.imageUrl;
    data['width'] = this.width;
    data['height'] = this.height;
    data['display_sitename'] = this.displaySitename;
    data['doc_url'] = this.docUrl;
    data['datetime'] = this.datetime;
    return data;
  }
}