import 'dart:math';

import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../models/api_response.dart';
import '../../../models/payment_model.dart';
import '../../../models/theme_template_model.dart';
import '../../../repositories/payment_repository.dart';
import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';
import '../../../services/cashfree_gateway_service.dart';

class PaymentController extends GetxController {
  PaymentController() {
    _paymentRepository = PaymentRepository();
  }

  @override
  void onInit() {
    super.onInit();
    template = Get.arguments;
  }

  late PaymentRepository _paymentRepository;

  late Template template;

  RxBool payWith = false.obs;
  RxBool isLoading = false.obs;

  void payNow() {
    if (payWith.value) {
      // goToWebSiteUrl();
      paymentGateway();
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          backgroundColor: ColorPallete.primary,
          duration: Duration(seconds: 2),
          message: "Must Select Payment Option !",
        ),
      );
    }
  }

  paymentGateway() async {
    isLoading.value = true;
    await CashfreePG().getInstance.makePayment(
          phoneNumber:
              Get.find<AuthService>().user.value.phoneNumber.toString(),
          amount: (double.parse(template.cost ?? "0.0") * 1.18).toString(),
          onSuccess: (paymentSuccessful) {
            isLoading.value = false;
            if (paymentSuccessful) {
              goToWebSiteUrl();
            }
          },
          onError: (p0, p1) {
            isLoading.value = false;
            Get.showSnackbar(
              GetSnackBar(
                backgroundColor: ColorPallete.red,
                duration: const Duration(seconds: 5),
                message: p0.getMessage(),
              ),
            );
          },
        );
  }

  String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  void goToWebSiteUrl() {
    PaymentReport data = PaymentReport(
      templateId: template.id,
      paymentId: "p_${Random(template.id).nextInt(200)}",
      amount: template.cost,
      color: template.selectedColor,
    );
    _paymentRepository.makePayment(data).then((value) {
      if (value.status == Status.COMPLETED) {
        Get.toNamed(Routes.WEB_CONGRATS);
      } else {
        Get.showSnackbar(
          GetSnackBar(
            backgroundColor: ColorPallete.red,
            duration: const Duration(seconds: 2),
            message: value.message,
          ),
        );
      }
    });
  }
}
