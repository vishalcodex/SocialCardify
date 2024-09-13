import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../../common/ui.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/template_controller.dart';

// ignore: must_be_immutable
class TemplatesScreen extends GetView<TemplateController> {
  const TemplatesScreen({Key? key}) : super(key: key);

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
          text: "Templates",
          color: ColorPallete.theme,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () {
                  controller.fetchData();
                  return Future.value();
                },
                child: MyListView(
                  scroll: true,
                  children: [
                    Obx(
                      () => controller.isLoading.value
                          ? const SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: ColorPallete.primary,
                                ),
                              ),
                            )
                          : controller.themes.isEmpty
                              ? const SizedBox(
                                  height: 200,
                                  width: double.infinity,
                                  child: Center(
                                      child: TextView(
                                    text: "No Templates Found!",
                                    fontSize: 16,
                                    color: ColorPallete.grey,
                                  )),
                                )
                              : Padding(
                                  padding: EdgeInsets.all(10.0 * fem),
                                  child: MyListView(
                                    children: controller.themes.map((element) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0 * fem,
                                            horizontal: 10 * fem),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10 * fem),
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
                                            borderColor: ColorPallete.grey
                                                .withOpacity(0.2),
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.all(10.0 * fem),
                                              child: MyListView(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                5.0 * fem),
                                                    child: TextView(
                                                      text: element.name!,
                                                      fontSize: 16,
                                                      color: ColorPallete
                                                          .secondary,
                                                      weight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10 * fem,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                5.0 * fem),
                                                    child: TextView(
                                                      text:
                                                          element.description!,
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
                                                                        "#${element.color1}"),
                                                              ),
                                                              CircleAvatar(
                                                                radius: 10,
                                                                backgroundColor:
                                                                    Ui.parseColor(
                                                                        "#${element.color2}"),
                                                              ),
                                                              CircleAvatar(
                                                                radius: 10,
                                                                backgroundColor:
                                                                    Ui.parseColor(
                                                                        "#${element.color3}"),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              TextView(
                                                                text:
                                                                    "₹ ${element.cost}/ Year",
                                                                fontSize: 18,
                                                                weight:
                                                                    FontWeight
                                                                        .bold,
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
                                                                      element);
                                                            },
                                                            child:
                                                                const RoundedContainer(
                                                              radius: 10,
                                                              borderColor:
                                                                  ColorPallete
                                                                      .primary,
                                                              child: Center(
                                                                child: TextView(
                                                                  text:
                                                                      "Preview",
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
                                                                      element);
                                                            },
                                                            child:
                                                                const RoundedContainer(
                                                              radius: 10,
                                                              color:
                                                                  ColorPallete
                                                                      .primary,
                                                              child: Center(
                                                                child: TextView(
                                                                  text:
                                                                      "Select",
                                                                  color:
                                                                      ColorPallete
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
                                      );
                                    }).toList(),
                                  ),
                                ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
