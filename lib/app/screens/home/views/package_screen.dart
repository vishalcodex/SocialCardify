import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';

class PackagesScreen extends GetView<HomeController> {
  const PackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
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
            title: TextView(
              text: "Packages",
              color: ColorPallete.theme,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                  child: MyListView(
                scroll: true,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 5.0 * fem, vertical: 20 * fem),
                    child: MyListView(
                      children: [
                        MyListView(
                          children: controller.packages.map((element) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0 * fem, horizontal: 10 * fem),
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
                                child: InkWell(
                                  onTap: () {
                                    // Get.toNamed(Routes.PACKAGES);
                                  },
                                  child: RoundedContainer(
                                    radius: 10,
                                    color: ColorPallete.theme,
                                    borderColor:
                                        ColorPallete.grey.withOpacity(0.2),
                                    child: Padding(
                                      padding: EdgeInsets.all(15.0 * fem),
                                      child: MyListView(
                                        children: [
                                          TextView(
                                            text: element["name"],
                                            fontSize: 16,
                                            weight: FontWeight.bold,
                                          ),
                                          SizedBox(
                                            height: 10 * fem,
                                          ),
                                          TextView(
                                            text: element["description"],
                                            fontSize: 12,
                                            color: ColorPallete.secondary,
                                            maxlines: 5,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            height: 10 * fem,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller
                                                  .onPackageSelected(element);
                                            },
                                            child: RoundedContainer(
                                              radius: 10,
                                              color: ColorPallete.primary,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.all(10.0 * fem),
                                                child: Center(
                                                  child: TextView(
                                                    text: "Start with this",
                                                    fontSize: 14,
                                                    color: ColorPallete.theme,
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
                              ),
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
