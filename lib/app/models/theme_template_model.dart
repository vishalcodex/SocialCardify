class Template {
  int? id;
  String? name;
  String? slug;
  String? description;
  String? cost;
  String? color1;
  String? color2;
  String? color3;
  String? selectedColor;
  String? fields;
  String? createdAt;
  String? updatedAt;

  Template(
      {this.id,
      this.name,
      this.slug,
      this.description,
      this.cost,
      this.color1,
      this.color2,
      this.color3,
      this.selectedColor,
      this.fields,
      this.createdAt,
      this.updatedAt});

  Template.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    cost = json['cost'];
    color1 = json['color1'];
    color2 = json['color2'];
    color3 = json['color3'];
    selectedColor = json['color1'];
    fields = json['fields'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['cost'] = this.cost;
    data['color1'] = this.color1;
    data['color2'] = this.color2;
    data['color3'] = this.color3;
    data['fields'] = this.fields;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
