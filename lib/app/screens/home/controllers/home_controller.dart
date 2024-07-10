import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../models/ads_model.dart';
import '../../../models/api_response.dart';
import '../../../models/blog_model.dart';
import '../../../models/my_referrals_model.dart';
import '../../../models/notification_model.dart';
import '../../../models/setting_model.dart';
import '../../../models/user_model.dart';
import '../../../models/videos_model.dart';
import '../../../repositories/slider_repository.dart';
import '../../../repositories/user_repository.dart';
import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';
import '../../membership/views/membership_view.dart';
import '../views/contact_us_view.dart';
import '../views/home_view.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;
import '../views/my_referrals_view.dart';

class HomeController extends GetxController {
  Rx<User> user = User().obs;
  // User(
  //         name: "Omkar Mhatre",
  //         email: "karomhatre@gmail.com",
  //         phoneNumber: "+919969383542",
  // ).obs;

  RxInt setTabIndex = 0.obs;
  RxBool isLiveAuction = true.obs;
  RxBool showMoreOptions = false.obs;
  List<String> moreOptions = ["Profile", "Logout"];
  RxString itemView = "LIST".obs;

  late var scaffoldKey = GlobalKey<ScaffoldState>();
  late UserRepository _userRepository;
  late SliderRepository _sliderRepository;

  HomeController() {
    _userRepository = UserRepository();
    _sliderRepository = SliderRepository();
  }

  late PackageInfo packageInfo;
  fetchInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  RxBool searchedClicked = false.obs;
  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    isLoading.value = false;

    user.value = Get.find<AuthService>().user.value;
    user.listen((updatedUser) {
      Get.find<AuthService>().user.value = updatedUser;
    });

    super.onInit();
    setTabIndex.listen((p0) {
      if (p0 == 3) {
        fetchMyReferrals();
      }
    });

    homeRefresh(refresh: false);
    fetchInfo();
  }

  late Timer sliderTimer;
  late Timer videosTimer;

  // TABS
  final List bottomTabs = [
    {
      "title": translations.home.tr,
      "icon": "assets/ui/home_icon.png",
      "pos": "0",
      "view": const HomeView()
    },
    {
      "title": translations.memCard.tr,
      "icon": "assets/ui/certificates.png",
      "pos": "1",
      "view": const MemebrshipScreen()
    },
    {
      "title": translations.contactUs.tr,
      "icon": "assets/ui/contact_us.png",
      "pos": "2",
      "view": const ContactUsView()
    },
    {
      "title": "Referrals",
      "icon": "assets/ui/user.png",
      "pos": "3",
      "view": MyReferralsView()
    }
  ];

  getTabScreen(index) {
    return bottomTabs[index]["view"];
  }

  void updateUser() async {
    await _userRepository.fetchUserDetails().then((value) {
      if (value.status == Status.COMPLETED) {
        user = User().obs;
        user.value = value.data;
        // user.value.membershipId = u0.membershipId;
        // user.value.balance = u0.balance;
        user.refresh();
      } else {
        Get.find<AuthService>().removeCurrentUser();
        Get.toNamed(Routes.AUTH);
      }
    });
  }

  DateFormat formater = DateFormat("dd/MM/yy");
  String getWeekDay(String date) {
    DateTime dateTime = formater.parse(date);
    return DateFormat("EEE").format(dateTime);
  }

  String getDate(String date) {
    DateTime dateTime = formater.parse(date);
    return DateFormat("d").format(dateTime);
  }

  RxList<Sliders> sliders = <Sliders>[].obs;
  RxList<Videos> videos = <Videos>[].obs;
  RxInt selectedAd = 0.obs;

  RxBool isGridView = true.obs;

  void homeRefresh({bool? refresh}) async {
    updateUser();
    fetchSliders(refresh ?? true);
    fetchVideos(refresh ?? true);
    fetchBlogs();
    fetchSettings();
    fetchNotifications();
    // fetchCategories();
  }

  late PageController sliderPageController = PageController();
  fetchSliders(bool refresh) async {
    sliders.value = [];
    await _sliderRepository.fetchSliders().then((value) {
      if (value.data != []) {
        sliders.value = value.data;
        selectedAd.value = 0;
        sliderPageController = PageController();
        if (!refresh) {
          sliderTimer =
              Timer.periodic(const Duration(milliseconds: 3000), (timer) {
            sliderPageController.animateToPage(
                sliderPageController.page!.toInt() + 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn);
          });
        } else {
          sliderTimer.cancel();
          sliderTimer =
              Timer.periodic(const Duration(milliseconds: 3000), (timer) {
            sliderPageController.animateToPage(
                sliderPageController.page!.toInt() + 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn);
          });
        }
      } else {}
      sliders.refresh();
    });
  }

  PageController videoPageController = PageController();
  fetchVideos(bool refresh) async {
    videos.value = [];
    await _sliderRepository.fetchVideos().then((value) {
      if (value.data != []) {
        videos.value = value.data;
        videoPageController = PageController();
        if (!refresh) {
          videosTimer =
              Timer.periodic(const Duration(milliseconds: 3500), (timer) {
            videoPageController.animateToPage(
                videoPageController.page!.toInt() + 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn);
          });
        } else {
          videosTimer.cancel();
          videosTimer =
              Timer.periodic(const Duration(milliseconds: 3500), (timer) {
            videoPageController.animateToPage(
                videoPageController.page!.toInt() + 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn);
          });
        }
      } else {}
      videos.refresh();
    });
  }

  RxList<Blog> blogs = <Blog>[].obs;
  fetchBlogs() async {
    blogs.value = [];
    await _sliderRepository.fetchBlogs().then((value) {
      if (value.data != []) {
        blogs.value = value.data;
      } else {}
      blogs.refresh();
    });
  }

  Rx<Setting> settings = Setting().obs;
  fetchSettings() async {
    await _sliderRepository.fetchSettings().then((value) {
      settings.value = value.data;
      settings.refresh();
    });
  }

  RxList<Map<String, dynamic>> roles = <Map<String, dynamic>>[
    {
      "name": "Free Lancer",
      "description":
          "Freelance Writer ,Graphic Designer , Software Developer ,Photographer, Consultant (in various fields such as business,finance, marketing, etc.), Small Business Owner, Real Estate Agent Personal Trainer, Artist (Painter, Sculptor, etc.), Web Developer Content Creator (YouTuber, Podcaster, Blogger), Virtual Assistant Online Tutor, Event Planner, Chef or Caterer"
    },
    {
      "name": "Retailer",
      "description":
          "grocery retail and vibrant textile and handloom sectors to eco-friendly organic farming enterprises and sustainable product ventures, these businesses contribute significantly to India's economic diversity. Services such as cleaning, catering, floristry, tailoring, and wellness, including yoga studios"
    },
    {
      "name": "Retailer",
      "description":
          "grocery retail and vibrant textile and handloom sectors to eco-friendly organic farming enterprises and sustainable product ventures, these businesses contribute significantly to India's economic diversity. Services such as cleaning, catering, floristry, tailoring, and wellness, including yoga studios"
    }
  ].obs;

  void onRoleSelected(Map<String, dynamic> element) {
    // Get.toNamed(Routes.PACKAGES);
    Get.toNamed(Routes.TEMPLATES);
  }

  RxList<Map<String, dynamic>> packages = <Map<String, dynamic>>[
    {
      "name": "Basic Package",
      "description":
          "Freelance Writer ,Graphic Designer , Software Developer ,Photographer, Consultant (in various fields such as business,finance, marketing, etc.), Small Business Owner, Real Estate Agent Personal Trainer, Artist (Painter, Sculptor, etc.), Web Developer Content Creator (YouTuber, Podcaster, Blogger), Virtual Assistant Online Tutor, Event Planner, Chef or Caterer"
    },
    {
      "name": "Economical Package",
      "description":
          "Freelance Writer ,Graphic Designer , Software Developer ,Photographer, Consultant (in various fields such as business,finance, marketing, etc.), Small Business Owner, Real Estate Agent Personal Trainer, Artist (Painter, Sculptor, etc.), Web Developer Content Creator (YouTuber, Podcaster, Blogger), Virtual Assistant Online Tutor, Event Planner, Chef or Caterer"
    },
    {
      "name": "Premium Package",
      "description":
          "Freelance Writer ,Graphic Designer , Software Developer ,Photographer, Consultant (in various fields such as business,finance, marketing, etc.), Small Business Owner, Real Estate Agent Personal Trainer, Artist (Painter, Sculptor, etc.), Web Developer Content Creator (YouTuber, Podcaster, Blogger), Virtual Assistant Online Tutor, Event Planner, Chef or Caterer"
    }
  ].obs;

  void onPackageSelected(Map<String, dynamic> element) {
    Get.toNamed(Routes.TEMPLATES);
  }

  RxList<MyNotification> notifications = <MyNotification>[].obs;
  fetchNotifications() async {
    _userRepository.fetchNotifications().then((value) {
      notifications.value = value.data;
      notifications.refresh();
    });
  }

  Rx<MyReferral> myReferral = MyReferral().obs;
  fetchMyReferrals() async {
    isLoading.value = true;
    await _userRepository.fetchMyReferrals().then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        myReferral.value = value.data;
        myReferral.refresh();
      }
    });
  }
}
