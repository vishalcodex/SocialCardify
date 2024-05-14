import '../providers/api_endpoints.dart';

class Service {
  int? id;
  int? userId;
  int? templateId;
  String? image;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;

  Service(
      {this.id,
      this.userId,
      this.templateId,
      this.image,
      this.name,
      this.description,
      this.createdAt,
      this.updatedAt});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    templateId = json['template_id'];
    image = Urls.getImageUrl(json['image']);
    name = json['name'];
    description = json['description'];
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
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
