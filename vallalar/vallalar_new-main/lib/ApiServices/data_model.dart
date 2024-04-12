

class DataModels {
  String? status;
  List<Categories>? categories;

  DataModels({this.status, this.categories});

  DataModels.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? id;
  String? name;
  String? thumbnail;
  String? mediaCount;

  Categories({this.id, this.name, this.thumbnail, this.mediaCount});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    thumbnail = json['thumbnail'];
    mediaCount = json['media_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['thumbnail'] = this.thumbnail;
    data['media_count'] = this.mediaCount;
    return data;
  }
}
