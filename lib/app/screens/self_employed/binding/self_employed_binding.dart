import 'package:get/get.dart';
import '../controllers/self_employed_controller.dart';

class SelfEmployedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelfEmployedController>(() => SelfEmployedController());
  }
}
