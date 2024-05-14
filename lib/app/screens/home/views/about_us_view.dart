import 'package:flutter_html/flutter_html.dart';

import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class AboutUsView extends GetView<HomeController> {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorPallete.theme,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorPallete.theme),
        backgroundColor: ColorPallete.primary,
        title: const TextView(
          text: "About Us",
          color: ColorPallete.theme,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          body: RoundedContainer(
            radius: 0,
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: MyListView(
                    scroll: true,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0 * fem),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedContainer(
                              radius: 150,
                              height: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                  "assets/ui/logo.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0 * fem),
                        child: MyListView(
                          children: [
                            SizedBox(
                              height: 10 * fem,
                            ),
                            Html(
                              data: controller.settings.value.aboutUs!,
                              style: {
                                "body": Style(color: ColorPallete.secondary)
                              },
                            ),
                            SizedBox(
                              height: 10 * fem,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: ColorPallete.grey.withOpacity(0.5),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: Offset(0, 0),
                    )
                  ]),
                  child: RoundedContainer(
                    radius: 0,
                    color: ColorPallete.theme,
                    child: Padding(
                      padding: EdgeInsets.all(30.0 * fem),
                      child: Center(
                        child: TextView(
                          text: "App Version ${controller.packageInfo.version}",
                          fontSize: 14,
                          weight: FontWeight.w600,
                          color: ColorPallete.secondary,
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
      floatingActionButton: CircleAvatar(
        backgroundColor: ColorPallete.primary,
        radius: 25 * fem,
        child: Icon(
          Icons.share_outlined,
          color: ColorPallete.theme,
          size: 30 * fem,
        ),
      ),
    );
  }
}
