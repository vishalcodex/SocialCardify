import 'whatsapp_model.dart';

class SocialLinks {
  int? id;
  int? userId;
  int? templateId;
  WhatsAppDetails? whatsappNumber;
  String? facebook;
  String? instagram;
  String? linkedin;
  String? twitter;
  String? behance;
  String? createdAt;
  String? updatedAt;

  SocialLinks(
      {this.id,
      this.userId,
      this.templateId,
      this.whatsappNumber,
      this.facebook,
      this.instagram,
      this.linkedin,
      this.twitter,
      this.behance,
      this.createdAt,
      this.updatedAt});

  SocialLinks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    templateId = json['template_id'];
    whatsappNumber = json['whatsapp_number'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    linkedin = json['linkedin'];
    twitter = json['twitter'];
    behance = json['behance'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['template_id'] = this.templateId;
    data['whatsapp_number'] = this.whatsappNumber;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['linkedin'] = this.linkedin;
    data['twitter'] = this.twitter;
    data['behance'] = this.behance;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
