class FactsDetails {
  int? id;
  int? userId;
  int? templateId;
  String? happyClients;
  String? hoursOfSupport;
  String? hardWorkers;
  String? technicalSkills;
  String? createdAt;
  String? updatedAt;

  FactsDetails(
      {this.id,
      this.userId,
      this.templateId,
      this.happyClients,
      this.hoursOfSupport,
      this.hardWorkers,
      this.technicalSkills,
      this.createdAt,
      this.updatedAt});

  FactsDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    templateId = json['template_id'];
    happyClients = json['happy_clients'];
    hoursOfSupport = json['hours_of_support'];
    hardWorkers = json['hard_workers'];
    technicalSkills = json['technical_skills'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['template_id'] = this.templateId;
    data['happy_clients'] = this.happyClients;
    data['hours_of_support'] = this.hoursOfSupport;
    data['hard_workers'] = this.hardWorkers;
    data['technical_skills'] = this.technicalSkills;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
