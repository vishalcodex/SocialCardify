import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/ui/my_list_view.dart';
import '../controllers/business_up_controller.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;
import '../../../components/ui/form_fields.dart';

// ignore: must_be_immutable
class BusinessAboutUsFormScreen extends GetView<BusinessController> {
  const BusinessAboutUsFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: ColorPallete.theme),
            backgroundColor: ColorPallete.primary,
            title: const TextView(
              text: "Business About Us Form",
              color: ColorPallete.theme,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.0 * fem, vertical: 10 * fem),
                  child: MyListView(
                    scroll: true,
                    children: [
                      Obx(
                        () => Column(
                          children: [
                            //Description
                            MyFormField(
                              initialValue:
                                  controller.aboutUsDetails.value.description,
                              fieldName: "About Description",
                              type: InputType.TEXT,
                              maxLines: 5,
                              keyboard: TextInputType.name,
                              onChanged: (value) {
                                controller.aboutUsDetails.value.description =
                                    value;
                              },
                              required: true,
                            ),
                            //Mission
                            MyFormField(
                              initialValue:
                                  controller.aboutUsDetails.value.mission,
                              fieldName: "Mission",
                              type: InputType.TEXT,
                              maxLines: 5,
                              keyboard: TextInputType.name,
                              onChanged: (value) {
                                controller.aboutUsDetails.value.mission = value;
                              },
                              required: true,
                            ),
                            //Vision
                            MyFormField(
                              initialValue:
                                  controller.aboutUsDetails.value.vision,
                              fieldName: "Vision",
                              type: InputType.TEXT,
                              maxLines: 5,
                              keyboard: TextInputType.name,
                              onChanged: (value) {
                                controller.aboutUsDetails.value.vision = value;
                              },
                              required: true,
                            ),
                            //Goal
                            MyFormField(
                              initialValue:
                                  controller.aboutUsDetails.value.goal,
                              fieldName: "Goal",
                              type: InputType.TEXT,
                              maxLines: 5,
                              keyboard: TextInputType.name,
                              onChanged: (value) {
                                controller.aboutUsDetails.value.goal = value;
                              },
                              required: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(color: ColorPallete.theme, boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 5,
                    color: ColorPallete.grey.withOpacity(0.5),
                  ),
                ]),
                child: Padding(
                  padding: EdgeInsets.all(10.0 * fem),
                  child: InkWell(
                    onTap: () {
                      controller.isLoading.value = false;
                      if (!controller.isLoading.value) {
                        controller.validateAndContinue(context, 3);
                      }
                    },
                    child: RoundedContainer(
                      radius: 10,
                      height: 50,
                      color: ColorPallete.primary,
                      child: Obx(
                        () => controller.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: ColorPallete.theme,
                                ),
                              )
                            : Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 15.0 * fem),
                                child: Center(
                                  child: TextView(
                                    text: translations.next.tr,
                                    color: ColorPallete.theme,
                                    fontSize: 16,
                                  ),
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
    );
  }
}
