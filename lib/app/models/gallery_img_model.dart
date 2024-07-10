import '../providers/api_endpoints.dart';

class GalleryImage {
  int? id;
  int? userId;
  int? templateId;
  String? image;
  String? name;
  String? createdAt;
  String? updatedAt;

  GalleryImage(
      {this.id,
      this.userId,
      this.templateId,
      this.image,
      this.name,
      this.createdAt,
      this.updatedAt});

  GalleryImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    templateId = json['template_id'];
    image = json['image'].toString().replaceAll(Urls.getImageUrl(""), "");
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['template_id'] = this.templateId;
    data['image'] = this.image;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
