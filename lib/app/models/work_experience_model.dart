class WorkExperience {
  int? id;
  int? userId;
  int? templateId;
  String? companyName;
  String? designation;
  String? description;
  String? createdAt;
  String? updatedAt;

  WorkExperience(
      {this.id,
      this.userId,
      this.templateId,
      this.companyName,
      this.designation,
      this.description,
      this.createdAt,
      this.updatedAt});

  WorkExperience.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    templateId = json['template_id'];
    companyName = json['company_name'];
    designation = json['designation'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['template_id'] = this.templateId;
    data['company_name'] = this.companyName;
    data['designation'] = this.designation;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
