import 'theme_template_model.dart';

class PaymentReport {
  int? id;
  int? userId;
  int? templateId;
  String? referredBy;
  String? paymentId;
  String? amount;
  String? renewalAt;
  String? color;
  String? createdAt;
  String? updatedAt;
  Template? template;

  PaymentReport(
      {this.id,
      this.userId,
      this.templateId,
      this.referredBy,
      this.paymentId,
      this.amount,
      this.renewalAt,
      this.color,
      this.createdAt,
      this.updatedAt,
      this.template});

  PaymentReport.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    templateId = json['template_id'];
    referredBy = json['referred_by'];
    paymentId = json['payment_id'];
    amount = json['amount'];
    renewalAt = json['renewal_at'];
    color = json['color'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    template = json['template'] != null
        ? new Template.fromJson(json['template'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['template_id'] = this.templateId;
    data['referred_by'] = this.referredBy;
    data['payment_id'] = this.paymentId;
    data['amount'] = this.amount;
    data['renewal_at'] = this.renewalAt;
    data['color'] = this.color;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.template != null) {
      data['template'] = this.template!.toJson();
    }
    return data;
  }
}
