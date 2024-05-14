import 'package:get/get.dart';

import '../models/api_response.dart';
import '../models/theme_template_model.dart';
import '../providers/api_provider.dart';

class TemplateRepository {
  late ApiProvider apiProvider;

  TemplateRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  Future<ApiResponse> getTemplates() async {
    return await apiProvider.makeAPICall("GET", "templates", {}).then((value) {
      value.data = (value.data["templates"] as List)
          .map((item) => Template.fromJson(item))
          .toList();
      return value;
    });
  }
}
