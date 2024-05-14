class Testimonial {
  int? id;
  int? templateId;
  String? name;
  String? designation;
  String? message;

  Testimonial(
      {this.id, this.templateId, this.name, this.designation, this.message});

  Testimonial.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    templateId = json['template_id'];
    name = json['name'];
    designation = json['designation'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['template_id'] = this.templateId;
    data['name'] = this.name;
    data['designation'] = this.designation;
    data['message'] = this.message;
    return data;
  }
}
