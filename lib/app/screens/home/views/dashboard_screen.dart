import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/custom_bottom_nav_bar.dart';
import '../../../components/ui/custom_drawer.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../routes/app_routes.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class MainScreen extends GetView<HomeController> {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: Scaffold(
          key: controller.scaffoldKey,
          // extendBody: true,
          backgroundColor: ColorPallete.theme,
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
            title: Obx(
              () => TextView(
                text: controller.bottomTabs[controller.setTabIndex.value]
                    ["title"],
                color: ColorPallete.theme,
                fontSize: 18,
                weight: FontWeight.bold,
              ),
            ),
            actions: [
              Obx(() => controller.setTabIndex.value == 0
                  ? InkWell(
                      onTap: () {
                        Get.toNamed(Routes.MY_WEBSITE);
                      },
                      child: RoundedContainer(
                        radius: 0,
                        child: Padding(
                          padding: EdgeInsets.all(10.0 * fem),
                          child: const Center(
                            child: TextView(
                              text: "My Website",
                              color: ColorPallete.theme,
                              weight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink()),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.NOTIFICATIONS);
                },
                child: Stack(
                  children: [
                    RoundedContainer(
                      radius: 0,
                      child: Padding(
                        padding: EdgeInsets.all(10.0 * fem),
                        child: Center(
                          child: const Icon(
                            Icons.notifications_none,
                            color: ColorPallete.theme,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 0,
                      child: Obx(
                        () => Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: ColorPallete.red,
                            child: TextView(
                              text: "${controller.notifications.length}",
                              color: ColorPallete.theme,
                              weight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          body: RoundedContainer(
            radius: 0,
            // height: MediaQuery.of(context).size.height,
            child: Obx(
              () => controller.getTabScreen(controller.setTabIndex.value),
            ),
          ),
          bottomNavigationBar: CustomBottomNavBar(),
          drawer: const CustomDrawer(),
        ),
      ),
    );
  }
}
