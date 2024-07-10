class MyReferral {
  String? totalCommission;
  String? totalUnpaidCommission;
  List<Referral>? referrals;

  MyReferral(
      {this.totalCommission, this.totalUnpaidCommission, this.referrals});

  MyReferral.fromJson(Map<String, dynamic> json) {
    totalCommission = json['total_commission'];
    totalUnpaidCommission = json['total_unpaid_commission'];
    // referrals = json['referrals'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_commission'] = this.totalCommission;
    data['total_unpaid_commission'] = this.totalUnpaidCommission;
    data['referrals'] = this.referrals!.map((e) => e.toJson());
    return data;
  }
}

class Referral {
  int? id;
  String? referralName;
  String? referredTemplate;
  String? referralCommission;
  String? referralCommissionPaid;
  String? createdAt;

  Referral(
      {this.id,
      this.referralName,
      this.referredTemplate,
      this.referralCommission,
      this.referralCommissionPaid,
      this.createdAt});

  Referral.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referralName = json['referral_name'];
    referredTemplate = json['referred_template'];
    referralCommission = json['referral_commission'];
    referralCommissionPaid = json['referral_commission_paid'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['referral_name'] = this.referralName;
    data['referred_template'] = this.referredTemplate;
    data['referral_commission'] = this.referralCommission;
    data['referral_commission_paid'] = this.referralCommissionPaid;
    data['created_at'] = this.createdAt;
    return data;
  }
}
