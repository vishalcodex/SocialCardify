import 'package:get/get.dart';

import '../models/api_response.dart';
import '../models/payment_model.dart';
import '../providers/api_provider.dart';
import 'package:dio/dio.dart' as dio;

class PaymentRepository {
  late ApiProvider apiProvider;

  PaymentRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  Future<ApiResponse> makePayment(PaymentReport data) async {
    var body = dio.FormData.fromMap(data.toJson());
    return await apiProvider
        .makeAPICall("POST", "payment_report/store", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.message = "Payment Completed Successfully !";
      }
      return value;
    });
  }

  Future<ApiResponse> fetchPayments() async {
    return await apiProvider
        .makeAPICall("GET", "payment_reports", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["data"] as List)
            .map((e) => PaymentReport.fromJson(e))
            .toList();
        value.message = "Payment Completed Successfully !";
      }
      return value;
    });
  }
}
