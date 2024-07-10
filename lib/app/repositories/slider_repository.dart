import 'package:get/get.dart';
import 'package:social_cardify/app/models/blog_model.dart';
import 'package:social_cardify/app/models/setting_model.dart';
import 'package:social_cardify/app/models/videos_model.dart';

import '../models/ads_model.dart';
import '../models/api_response.dart';
import '../providers/api_provider.dart';

class SliderRepository {
  late ApiProvider apiProvider;

  SliderRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  Future<ApiResponse> fetchSliders() async {
    return await apiProvider.makeAPICall("GET", "sliders", {}).then((value) {
      List<Sliders> sliders = [];
      if (value.status == Status.COMPLETED) {
        sliders = (value.data["sliders"] as List)
            .map((e) => Sliders.fromJson(e))
            .toList();
      }
      value.data = sliders;
      return value;
    });
  }

  Future<ApiResponse> fetchVideos() async {
    return await apiProvider.makeAPICall("GET", "videos", {}).then((value) {
      List<Videos> sliders = [];
      if (value.status == Status.COMPLETED) {
        sliders = (value.data["videos"] as List)
            .map((e) => Videos.fromJson(e))
            .toList();
      }
      value.data = sliders;
      return value;
    });
  }

  Future<ApiResponse> fetchSettings() async {
    return await apiProvider.makeAPICall("GET", "settings", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = Setting.fromJson(value.data["setting"]);
      }
      return value;
    });
  }

  Future<ApiResponse> fetchBlogs() async {
    return await apiProvider.makeAPICall("GET", "blogs", {}).then((value) {
      List<Blog> blogs = [];
      if (value.status == Status.COMPLETED) {
        blogs =
            (value.data["blogs"] as List).map((e) => Blog.fromJson(e)).toList();
      }
      value.data = blogs;
      return value;
    });
  }
}
