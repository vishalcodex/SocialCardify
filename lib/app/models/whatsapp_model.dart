class WhatsAppDetails {
  int? id;
  int? userId;
  int? templateId;
  String? whatsappNumber;
  String? createdAt;
  String? updatedAt;

  WhatsAppDetails(
      {this.id,
      this.userId,
      this.templateId,
      this.whatsappNumber,
      this.createdAt,
      this.updatedAt});

  WhatsAppDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    templateId = json['template_id'];
    whatsappNumber = json['whatsapp_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['template_id'] = this.templateId;
    data['whatsapp_number'] = this.whatsappNumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
