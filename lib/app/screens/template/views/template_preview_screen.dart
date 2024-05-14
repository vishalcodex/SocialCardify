import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../common/color_pallete.dart';
import '../../../../common/ui.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/template_controller.dart';

// ignore: must_be_immutable
class TemplatePreviewScreen extends GetView<TemplateController> {
  const TemplatePreviewScreen({Key? key}) : super(key: key);

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
          text: "Preview Of Theme",
          color: ColorPallete.theme,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: WebViewWidget(
                controller: controller.templateViewController,
              ),
            ),

            //Select Theme Button
            Container(
              decoration: BoxDecoration(color: ColorPallete.theme, boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 5,
                  color: ColorPallete.grey.withOpacity(0.5),
                ),
              ]),
              child: MyListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 5.0 * fem, horizontal: 10 * fem),
                    child: const TextView(
                      text: "Choose color for your website:",
                      color: ColorPallete.secondary,
                      fontSize: 14,
                    ),
                  ),
                  RoundedContainer(
                    radius: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            {
                              "id": 1,
                              "color": controller.selectedTheme.value.color1
                            },
                            {
                              "id": 2,
                              "color": controller.selectedTheme.value.color2
                            },
                            {
                              "id": 3,
                              "color": controller.selectedTheme.value.color3
                            },
                          ].map((e) {
                            bool isSelected = e["color"].toString() ==
                                controller.selectedTheme.value.selectedColor;
                            return Expanded(
                              child: InkWell(
                                onTap: () {
                                  controller.selectedTheme.value.selectedColor =
                                      e["color"].toString();
                                  controller.selectedTheme.refresh();
                                },
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor:
                                          Ui.parseColor("#${e["color"]}"),
                                    ),
                                    SizedBox(
                                      height: 5 * fem,
                                    ),
                                    TextView(
                                      text: "Color ${e["id"]}",
                                      color: isSelected
                                          ? ColorPallete.primary
                                          : ColorPallete.grey,
                                      weight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.w500,
                                    )
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0 * fem),
                    child: InkWell(
                      onTap: () {
                        controller
                            .onThemeSelected(controller.selectedTheme.value);
                      },
                      child: RoundedContainer(
                        radius: 10,
                        color: ColorPallete.primary,
                        child: Padding(
                          padding: EdgeInsets.all(15.0 * fem),
                          child: const Center(
                              child: TextView(
                            text: "Select Theme",
                            fontSize: 14,
                            weight: FontWeight.bold,
                            color: ColorPallete.theme,
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
