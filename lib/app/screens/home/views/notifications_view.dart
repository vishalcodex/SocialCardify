import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class NotificationsScreen extends GetView<HomeController> {
  const NotificationsScreen({Key? key}) : super(key: key);
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
          text: "Notifications",
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
                Obx(
                  () => Expanded(
                    child: RefreshIndicator(
                      onRefresh: () {
                        controller.fetchNotifications();
                        return Future.value();
                      },
                      child: MyListView(
                        scroll: true,
                        children: [
                          SizedBox(
                            height: 10 * fem,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 20.0 * fem),
                            child: MyListView(
                              children: controller.notifications.map((element) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0 * fem),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10 * fem),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 10,
                                              spreadRadius: 2.5,
                                              color: ColorPallete.grey
                                                  .withOpacity(0.5),
                                              offset: Offset(0, 5 * fem))
                                        ]),
                                    child: RoundedContainer(
                                      radius: 10,
                                      color: ColorPallete.theme,
                                      clip: Clip.antiAliasWithSaveLayer,
                                      child: MyListView(
                                        children: [
                                          RoundedContainer(
                                            radius: 10,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                4,
                                            clip: Clip.antiAliasWithSaveLayer,
                                            child: Image.network(
                                              element.image ?? "",
                                              fit: BoxFit.fill,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return RoundedContainer(
                                                  radius: 0,
                                                  color: ColorPallete.grey
                                                      .withOpacity(0.5),
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5 * fem,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10.0 * fem),
                                            child: TextView(
                                              text: element.title!,
                                              fontSize: 14,
                                              color: ColorPallete.secondary,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            height: 10 * fem,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
