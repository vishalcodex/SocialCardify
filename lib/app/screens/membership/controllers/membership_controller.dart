import 'package:get/get.dart';
import 'package:social_cardify/app/models/payment_model.dart';

import '../../../models/theme_template_model.dart';
import '../../../repositories/payment_repository.dart';
import '../../home/controllers/home_controller.dart';

class MembershipController extends GetxController {
  late PaymentRepository _paymentRepository;
  MembershipController() {
    _paymentRepository = PaymentRepository();
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
    content.value =
        Get.find<HomeController>().settings.value.membershipBenefits ?? "";
    Get.find<HomeController>().settings.listen((p0) {
      content.value = p0.membershipBenefits!;
    });
  }

  RxString content = "".obs;

  Rx<PaymentReport> paymentReport = PaymentReport().obs;
  Rx<Template> template = Template().obs;

  void fetchPaymentReport() async {
    isLoading.value = true;
    await _paymentRepository.fetchPayments().then((value) {
      isLoading.value = false;
      if (value.data != []) {
        paymentReport.value = (value.data as List).first;
        template.value = paymentReport.value.template!;
        paymentReport.refresh();
      }
    });
  }

  void fetchData() {
    fetchPaymentReport();
  }

  RxBool isLoading = false.obs;
  void refreshView() {
    Get.find<HomeController>().fetchSettings();
    fetchPaymentReport();
  }
}
