import 'package:get/get.dart';
import '../../business/controllers/business_up_controller.dart';
import '../../self_employed/controllers/self_employed_controller.dart';
import '../controllers/template_controller.dart';

class TemplateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TemplateController>(() => TemplateController());
    Get.lazyPut<BusinessController>(() => BusinessController());
    Get.lazyPut<SelfEmployedController>(() => SelfEmployedController());
    // Get.put<BusinessController>(BusinessController());
    // Get.put<SelfEmployedController>(SelfEmployedController());
  }
}
