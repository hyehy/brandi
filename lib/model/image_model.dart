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
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (documents != null) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_count'] = totalCount;
    data['pageable_count'] = pageableCount;
    data['is_end'] = isEnd;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['collection'] = collection;
    data['thumbnail_url'] = thumbnailUrl;
    data['image_url'] = imageUrl;
    data['width'] = width;
    data['height'] = height;
    data['display_sitename'] = displaySitename;
    data['doc_url'] = docUrl;
    data['datetime'] = datetime;
    return data;
  }
}
