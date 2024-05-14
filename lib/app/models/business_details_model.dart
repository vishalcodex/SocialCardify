import '../providers/api_endpoints.dart';

class BusinessDetails {
  int? id;
  int? userId;
  int? templateId;
  String? logo;
  String? name;
  String? details;
  String? createdAt;
  String? updatedAt;

  BusinessDetails(
      {this.id,
      this.userId,
      this.templateId,
      this.logo,
      this.name,
      this.details,
      this.createdAt,
      this.updatedAt});

  BusinessDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    templateId = json['template_id'];
    logo = json['logo'] != null ? Urls.getImageUrl(json['logo']) : json['logo'];
    name = json['name'];
    details = json['details'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['template_id'] = this.templateId;
    data['logo'] = this.logo;
    data['name'] = this.name;
    data['details'] = this.details;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
