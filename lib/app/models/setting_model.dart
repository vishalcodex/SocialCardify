class Setting {
  int? id;
  String? oneSignalId;
  String? paymentId;
  String? membershipBenefits;
  String? aboutUs;
  String? termsAndConditions;
  String? appVersion;
  String? createdAt;
  String? updatedAt;

  Setting(
      {this.id,
      this.oneSignalId,
      this.paymentId,
      this.membershipBenefits,
      this.aboutUs,
      this.termsAndConditions,
      this.appVersion,
      this.createdAt,
      this.updatedAt});

  Setting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    oneSignalId = json['one_signal_id'];
    paymentId = json['payment_id'];
    membershipBenefits = json['membership_benefits'];
    aboutUs = json['about_us'];
    termsAndConditions = json['terms_and_conditions'];
    appVersion = json['app_version'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['one_signal_id'] = this.oneSignalId;
    data['payment_id'] = this.paymentId;
    data['membership_benefits'] = this.membershipBenefits;
    data['about_us'] = this.aboutUs;
    data['terms_and_conditions'] = this.termsAndConditions;
    data['app_version'] = this.appVersion;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
