import 'package:get/get.dart';
import '../../membership/controllers/membership_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<MembershipController>(MembershipController());
    // Get.put<BlogController>(BlogController());
  }
}
