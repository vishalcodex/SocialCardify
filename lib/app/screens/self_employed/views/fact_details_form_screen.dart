import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/ui/my_list_view.dart';
import '../controllers/self_employed_controller.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

import '../../../components/ui/form_fields.dart';

// ignore: must_be_immutable
class FactDetailsFormScreen extends GetView<SelfEmployedController> {
  const FactDetailsFormScreen({Key? key}) : super(key: key);

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
              text: "Facts Form",
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
                            //Happy Clients
                            MyFormField(
                              initialValue:
                                  controller.factsDetails.value.happyClients,
                              fieldName: "Happy Clients",
                              type: InputType.TEXT,
                              keyboard: TextInputType.number,
                              onChanged: (value) {
                                controller.factsDetails.value.happyClients =
                                    value;
                              },
                              required: true,
                            ),
                            //Hours Of Support
                            MyFormField(
                              initialValue:
                                  controller.factsDetails.value.hoursOfSupport,
                              fieldName: "Hours Of Support",
                              type: InputType.TEXT,
                              keyboard: TextInputType.number,
                              onChanged: (value) {
                                controller.factsDetails.value.hoursOfSupport =
                                    value;
                              },
                              required: true,
                            ),
                            //Hard Workers
                            MyFormField(
                              initialValue:
                                  controller.factsDetails.value.hardWorkers,
                              fieldName: "Hard Workers",
                              type: InputType.TEXT,
                              keyboard: TextInputType.number,
                              onChanged: (value) {
                                controller.factsDetails.value.hardWorkers =
                                    value;
                              },
                              required: true,
                            ),
                            //Technical Skills
                            MyFormField(
                              initialValue:
                                  controller.factsDetails.value.technicalSkills,
                              fieldName: "Technical Skills",
                              type: InputType.TEXT,
                              keyboard: TextInputType.number,
                              onChanged: (value) {
                                controller.factsDetails.value.technicalSkills =
                                    value;
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
                        controller.validateAndContinue(context, 2);
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
                                    text: translations.submit.tr,
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
