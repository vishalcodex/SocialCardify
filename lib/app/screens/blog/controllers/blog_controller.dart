import 'package:get/get.dart';

import '../../../models/blog_model.dart';

class BlogController extends GetxController {
  RxList<Blog> blogs = <Blog>[].obs;
  Rx<Blog> selectedBlog = Blog().obs;

  RxInt selectedIndex = 0.obs;

  BlogController() {}
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments?["blog"] != null) {
      selectedBlog = Blog().obs;
      selectedBlog.value = Get.arguments["blog"] ?? Blog();
      selectedBlog.refresh();
    }
  }
}
