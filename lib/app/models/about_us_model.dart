class AboutUs {
  int? id;
  int? userId;
  int? templateId;
  String? description;
  String? mission;
  String? vision;
  String? goal;
  String? createdAt;
  String? updatedAt;

  AboutUs(
      {this.id,
      this.userId,
      this.templateId,
      this.description,
      this.mission,
      this.vision,
      this.goal,
      this.createdAt,
      this.updatedAt});

  AboutUs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    templateId = json['template_id'];
    description = json['description'];
    mission = json['mission'];
    vision = json['vision'];
    goal = json['goal'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['template_id'] = this.templateId;
    data['description'] = this.description;
    data['mission'] = this.mission;
    data['vision'] = this.vision;
    data['goal'] = this.goal;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
