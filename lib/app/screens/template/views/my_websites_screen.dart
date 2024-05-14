import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../common/color_pallete.dart';
import '../../../../common/ui.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../providers/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';
import '../controllers/template_controller.dart';

// ignore: must_be_immutable
class MyWebsiteScreen extends GetView<TemplateController> {
  const MyWebsiteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    controller.fetchPaymentReport();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorPallete.theme),
        backgroundColor: ColorPallete.primary,
        title: const TextView(
          text: "My Website",
          color: ColorPallete.theme,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Obx(
                    () => (controller.selectedTheme.value.name ?? "") != ""
                        ? WebViewWidget(
                            controller: controller.webViewController,
                          )
                        : Padding(
                            padding: EdgeInsets.all(20.0 * fem),
                            child: SizedBox(
                              height: 200 * fem,
                              child: Column(
                                children: [
                                  const Expanded(
                                    child: Center(
                                      child: TextView(
                                        text:
                                            "Please Purchase a template to view Your Website",
                                        fontSize: 16,
                                        color: ColorPallete.secondary,
                                        alignment: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Center(
                                      child: InkWell(
                                        onTap: () {
                                          Get.toNamed(Routes.CREATE_WEBSITE);
                                        },
                                        child: RoundedContainer(
                                          radius: 10,
                                          color: ColorPallete.primary,
                                          child: Padding(
                                            padding: EdgeInsets.all(15.0 * fem),
                                            child: const Center(
                                              child: TextView(
                                                text: "Create Website",
                                                color: ColorPallete.theme,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: MyListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0 * fem, horizontal: 10 * fem),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10 * fem),
                                color: Colors.transparent,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 2.5,
                                      color: ColorPallete.grey.withOpacity(0.5),
                                      offset: Offset(0, 5 * fem))
                                ]),
                            child: RoundedContainer(
                              radius: 10,
                              color: ColorPallete.theme,
                              borderColor: ColorPallete.grey.withOpacity(0.2),
                              child: Padding(
                                padding: EdgeInsets.all(10.0 * fem),
                                child: Obx(
                                  () => (controller.selectedTheme.value.name ??
                                              "") ==
                                          ""
                                      ? controller.isLoading.value
                                          ? const SizedBox(
                                              height: 150,
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            )
                                          : SizedBox(
                                              height: 200 * fem,
                                              child: const Center(
                                                child: TextView(
                                                  text:
                                                      "Please Purchase a template to view Membership Details",
                                                  fontSize: 16,
                                                  color: ColorPallete.secondary,
                                                  alignment: TextAlign.center,
                                                ),
                                              ),
                                            )
                                      : MyListView(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.0 * fem),
                                              child: TextView(
                                                text: controller
                                                    .selectedTheme.value.name!,
                                                fontSize: 16,
                                                color: ColorPallete.secondary,
                                                weight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10 * fem,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.0 * fem),
                                              child: TextView(
                                                text: controller.selectedTheme
                                                    .value.description!,
                                                fontSize: 12,
                                                color: ColorPallete.grey,
                                                weight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10 * fem,
                                            ),
                                            RoundedContainer(
                                              radius: 0,
                                              height: 30,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 10,
                                                          backgroundColor:
                                                              Ui.parseColor(
                                                                  "#${controller.selectedTheme.value.color1}"),
                                                        ),
                                                        CircleAvatar(
                                                          radius: 10,
                                                          backgroundColor:
                                                              Ui.parseColor(
                                                                  "#${controller.selectedTheme.value.color2}"),
                                                        ),
                                                        CircleAvatar(
                                                          radius: 10,
                                                          backgroundColor:
                                                              Ui.parseColor(
                                                                  "#${controller.selectedTheme.value.color3}"),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        TextView(
                                                          text:
                                                              "₹ ${controller.selectedTheme.value.cost}/-",
                                                          fontSize: 18,
                                                          weight:
                                                              FontWeight.bold,
                                                        ),
                                                        SizedBox(
                                                          width: 10 * fem,
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10 * fem,
                                            ),
                                            RoundedContainer(
                                              radius: 0,
                                              height: 30,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () {
                                                        controller
                                                            .toPreviewSelectedTheme(
                                                                controller
                                                                    .selectedTheme
                                                                    .value);
                                                      },
                                                      child:
                                                          const RoundedContainer(
                                                        radius: 10,
                                                        borderColor:
                                                            ColorPallete
                                                                .primary,
                                                        child: Center(
                                                          child: TextView(
                                                            text: "Preview",
                                                            color: ColorPallete
                                                                .primary,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10 * fem,
                                                  ),
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () {
                                                        controller
                                                            .onThemeSelected(
                                                                controller
                                                                    .selectedTheme
                                                                    .value);
                                                      },
                                                      child:
                                                          const RoundedContainer(
                                                        radius: 10,
                                                        color: ColorPallete
                                                            .primary,
                                                        child: Center(
                                                          child: TextView(
                                                            text: "Edit",
                                                            color: ColorPallete
                                                                .theme,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5 * fem,
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0 * fem, vertical: 10 * fem),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                Share.share(
                                    "Check out my new website ${Urls.baseUrl}website/${Get.find<AuthService>().user.value.username}");
                              },
                              child: RoundedContainer(
                                radius: 10,
                                color: ColorPallete.primary,
                                child: Padding(
                                  padding: EdgeInsets.all(10.0 * fem),
                                  child: const Center(
                                    child: TextView(
                                      text: "Share My Website",
                                      color: ColorPallete.theme,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
