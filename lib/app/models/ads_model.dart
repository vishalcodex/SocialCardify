import '../providers/api_endpoints.dart';

class Sliders {
  int? id;
  String? name;
  String? image;
  String? title;
  String? description;

  Sliders({this.id, this.image, this.title, this.description});

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = Urls.getImageUrl(json['image']);
    name = json['name'];
    // image = json['image'];
    // title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
