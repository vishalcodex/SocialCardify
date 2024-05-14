import 'package:intl/intl.dart';

import '../providers/api_endpoints.dart';

class PersonalDetails {
  int? id;
  int? userId;
  int? templateId;
  String? aboutDescription;
  String? careerObjective;
  String? education;
  String? gender;
  String? email;
  String? phoneNumber;
  String? maritalStatus;
  String? age;
  String? dob;
  String? photo;
  String? designation;
  String? createdAt;
  String? updatedAt;

  PersonalDetails(
      {this.id,
      this.userId,
      this.templateId,
      this.aboutDescription,
      this.careerObjective,
      this.education,
      this.gender,
      this.email,
      this.phoneNumber,
      this.maritalStatus,
      this.age,
      this.dob,
      this.photo,
      this.designation,
      this.createdAt,
      this.updatedAt});

  PersonalDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    templateId = json['template_id'];
    aboutDescription = json['about_description'];
    careerObjective = json['career_objective'];
    education = json['education'];
    gender = json['gender'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    maritalStatus = json['marital_status'];
    age = json['age'];
    dob = json['dob'];
    photo = Urls.getImageUrl(json['photo']);
    designation = json['designation'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['template_id'] = this.templateId;
    data['about_description'] = this.aboutDescription;
    data['career_objective'] = this.careerObjective;
    data['education'] = this.education;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['marital_status'] = this.maritalStatus;
    data['age'] = this.age != null
        ? this.age
        : this.dob == ""
            ? ""
            : (DateTime.now()
                        .difference(DateFormat("dd-MM-yyyy").parse(this.dob!))
                        .inDays /
                    365)
                .floor();
    data['dob'] = this.dob;
    data['photo'] = this.photo;
    data['designation'] = this.designation;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
