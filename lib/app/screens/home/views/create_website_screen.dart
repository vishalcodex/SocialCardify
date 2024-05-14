import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';

class CreateWebsiteScreen extends GetView<HomeController> {
  const CreateWebsiteScreen({super.key});

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
              text: "Create A Website",
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
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
                          child: const TextView(
                            text: "Please select your Role",
                            fontSize: 16,
                            color: ColorPallete.secondary,
                            weight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15 * fem,
                        ),
                        MyListView(
                          children: controller.roles.map((element) {
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
                                    controller.onRoleSelected(element);
                                  },
                                  child: RoundedContainer(
                                    radius: 10,
                                    color: ColorPallete.theme,
                                    borderColor:
                                        ColorPallete.grey.withOpacity(0.2),
                                    child: Padding(
                                      padding: EdgeInsets.all(15.0 * fem),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: MyListView(
                                              children: [
                                                const TextView(
                                                  text: "I'm,",
                                                  fontSize: 16,
                                                  color: ColorPallete.secondary,
                                                ),
                                                TextView(
                                                  text: element["name"],
                                                  fontSize: 16,
                                                  weight: FontWeight.bold,
                                                ),
                                                SizedBox(
                                                  height: 5 * fem,
                                                ),
                                                TextView(
                                                  text: element["description"],
                                                  fontSize: 12,
                                                  color: ColorPallete.secondary,
                                                  maxlines: 5,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5 * fem,
                                          ),
                                          CircleAvatar(
                                            backgroundColor:
                                                ColorPallete.primary,
                                            child: Icon(
                                              Icons.arrow_forward,
                                              color: ColorPallete.theme,
                                              size: 25,
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
