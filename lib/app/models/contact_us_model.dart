import 'whatsapp_model.dart';

class ContactUs {
  int? id;
  int? userId;
  int? templateId;
  String? address;
  String? phoneNumber;
  WhatsAppDetails? whatsAppNumber;
  String? email;
  String? contactNumber;
  String? contactPerson;
  String? facebook;
  String? instagram;
  String? createdAt;
  String? updatedAt;

  ContactUs(
      {this.id,
      this.userId,
      this.templateId,
      this.address,
      this.phoneNumber,
      this.email,
      this.contactNumber,
      this.facebook,
      this.instagram,
      this.createdAt,
      this.updatedAt});

  ContactUs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    templateId = json['template_id'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    contactNumber = json['contact_number'];
    contactPerson = json['contact_person'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['template_id'] = this.templateId;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['whatsapp_number'] = this.whatsAppNumber;
    data['email'] = this.email;
    data['contact_number'] = this.contactNumber;
    data['contact_person'] = this.contactPerson;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
