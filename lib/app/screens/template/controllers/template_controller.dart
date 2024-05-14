import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../models/payment_model.dart';
import '../../../models/theme_template_model.dart';
import '../../../providers/api_endpoints.dart';
import '../../../repositories/payment_repository.dart';
import '../../../repositories/template_repository.dart';
import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';

class TemplateController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxString quote = "".obs;
  PageController pageController = PageController();

  late TemplateRepository _templateRepository;
  late PaymentRepository _paymentRepository;

  TemplateController() {
    _templateRepository = TemplateRepository();
    _paymentRepository = PaymentRepository();
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
    selectedTheme.listen((p0) {
      templateViewController.loadRequest(Uri.parse(
          "https://socialcardify.digitalji.in/templates/${p0.slug}/${p0.selectedColor}/preview"));
    });
  }

  WebViewController templateViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );

  WebViewController webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(
        "${Urls.baseUrl}website/${Get.find<AuthService>().user.value.username}"));

  RxList<Template> themes = <Template>[].obs;
  RxList<PaymentReport> reports = <PaymentReport>[].obs;
  Rx<Template> selectedTheme = Template().obs;
  RxBool isLoading = false.obs;
  void toPreviewSelectedTheme(Template template) {
    selectedTheme.value = template;
    Get.toNamed(Routes.TEMPLATE_PREVIEW);
  }

  onColorChanged(String color) {}

  void onThemeSelected(Template template) {
    selectedTheme.value = template;
    if (selectedTheme.value.id! >= 3) {
      Get.toNamed(Routes.BUSINESS_DETAIL_FORM,
          arguments: {"template": selectedTheme.value});
    } else {
      Get.toNamed(Routes.PERSONAL_DETAILS_FORM,
          arguments: {"template": selectedTheme.value});
    }
  }

  void fetchData() async {
    themes.value = [];
    await _templateRepository.getTemplates().then((value) {
      themes.value = value.data;
      themes.refresh();
    });
  }

  void fetchPaymentReport() async {
    isLoading.value = true;
    await _paymentRepository.fetchPayments().then((value) {
      isLoading.value = false;
      reports.value = value.data;
      if (reports.isNotEmpty) {
        selectedTheme.value = reports.first.template!;
        selectedTheme.value.selectedColor = reports.first.color;
        reports.refresh();
        selectedTheme.refresh();
      }
    });
  }
}
