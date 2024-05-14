import '../providers/api_endpoints.dart';

class Blog {
  int? id;
  String? title;
  String? image;
  String? description;
  String? createdAt;
  String? updatedAt;

  Blog({this.id, this.title, this.description, this.createdAt, this.updatedAt});

  Blog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = Urls.getImageUrl(json['image']);
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
