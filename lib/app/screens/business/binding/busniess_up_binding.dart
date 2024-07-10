import 'package:get/get.dart';
import '../controllers/business_up_controller.dart';

class BusinessBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BusinessController>(BusinessController());
  }
}
