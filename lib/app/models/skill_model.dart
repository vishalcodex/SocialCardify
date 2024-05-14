class Skill {
  int? id;
  int? userId;
  int? templateId;
  String? name;
  String? percentage;
  String? createdAt;
  String? updatedAt;

  Skill(
      {this.id,
      this.userId,
      this.templateId,
      this.name,
      this.percentage,
      this.createdAt,
      this.updatedAt});

  Skill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    templateId = json['template_id'];
    name = json['name'];
    percentage = json['percentage'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['template_id'] = this.templateId;
    data['name'] = this.name;
    data['percentage'] = this.percentage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
