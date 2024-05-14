import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:social_cardify/app/services/auth_service.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../providers/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../controllers/payment_controller.dart';

// ignore: must_be_immutable
class PaymentCompleteScreen extends GetView<PaymentController> {
  const PaymentCompleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorPallete.theme),
        backgroundColor: ColorPallete.primary,
        // leading: InkWell(
        //   onTap: () {
        //     controller.scaffoldKey.currentState!.openDrawer();
        //   },
        //   child: const Icon(
        //     Icons.menu,
        //     color: ColorPallete.primary,
        //   ),
        // ),
        title: const TextView(
          text: "Thank You",
          color: ColorPallete.theme,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
      ),
      body: WillPopScope(
        onWillPop: () {
          Get.offAllNamed(
            Routes.HOME,
            predicate: (route) => Get.currentRoute == "/home",
          );
          return Future.value(false);
        },
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: RoundedContainer(
                    radius: 10,
                    child: Padding(
                      padding: EdgeInsets.all(15.0 * fem),
                      child: MyListView(
                        children: [
                          const Center(
                            child: TextView(
                              text: "Congrats",
                              fontSize: 30,
                              color: ColorPallete.red,
                              weight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20 * fem,
                          ),
                          const Center(
                            child: TextView(
                              text:
                                  "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. accompanied by English versions from the 1914 translation by H. Rackham.",
                              fontSize: 12,
                              color: ColorPallete.secondary,
                              alignment: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20 * fem,
                          ),
                          const Center(
                            child: TextView(
                              text: "This is your Website URL",
                              fontSize: 14,
                              color: ColorPallete.secondary,
                              alignment: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 15 * fem,
                          ),
                          Center(
                            child: TextView(
                              text:
                                  "${Urls.baseUrl}website/${Get.find<AuthService>().user.value.username}",
                              fontSize: 16,
                              color: ColorPallete.secondary,
                              alignment: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20 * fem,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {
                                  // controller.goToWebSiteUrl();
                                  await Clipboard.setData(ClipboardData(
                                          text:
                                              "${Urls.baseUrl}website/${Get.find<AuthService>().user.value.username}"))
                                      .then((value) {
                                    log("${Urls.baseUrl}website/${Get.find<AuthService>().user.value.username}");
                                    Get.showSnackbar(
                                      const GetSnackBar(
                                        backgroundColor: ColorPallete.primary,
                                        duration: Duration(seconds: 3),
                                        message: "URL copied to Clipboard",
                                      ),
                                    );
                                  });
                                },
                                child: RoundedContainer(
                                  radius: 5,
                                  color: Colors.green,
                                  child: Padding(
                                    padding: EdgeInsets.all(15.0 * fem),
                                    child: const Center(
                                      child: TextView(
                                        text: "Copy Now",
                                        fontSize: 16,
                                        color: ColorPallete.theme,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25 * fem,
                          ),
                          InkWell(
                            onTap: () {
                              Share.share(
                                  "Check out my new website ${Urls.baseUrl}website/${Get.find<AuthService>().user.value.username}");
                            },
                            child: RoundedContainer(
                              radius: 5,
                              color: Colors.green,
                              child: Padding(
                                padding: EdgeInsets.all(15.0 * fem),
                                child: const Center(
                                  child: TextView(
                                    text: "Share URL",
                                    fontSize: 16,
                                    color: ColorPallete.theme,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
