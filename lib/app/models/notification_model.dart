class MyNotification {
  int? id;
  String? title;
  String? image;
  String? createdAt;
  String? updatedAt;

  MyNotification(
      {this.id, this.title, this.image, this.createdAt, this.updatedAt});

  MyNotification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json["image"] ?? "";
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
