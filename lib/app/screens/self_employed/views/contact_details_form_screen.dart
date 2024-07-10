import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_cardify/app/models/whatsapp_model.dart';
import '../../../components/ui/my_list_view.dart';
import '../controllers/self_employed_controller.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;
import '../../../components/ui/form_fields.dart';

// ignore: must_be_immutable
class ContactDetailsFormScreen extends GetView<SelfEmployedController> {
  const ContactDetailsFormScreen({Key? key}) : super(key: key);

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
              text: "Social Links Form",
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
                            //LinkedIn URL
                            MyFormField(
                              initialValue:
                                  controller.contactUsDetails.value.linkedin,
                              fieldName: "LinkedIn URL",
                              type: InputType.TEXT,
                              keyboard: TextInputType.text,
                              onChanged: (value) {
                                controller.contactUsDetails.value.linkedin =
                                    value;
                              },
                              required: true,
                            ),
                            //Twitter URL
                            MyFormField(
                              initialValue:
                                  controller.contactUsDetails.value.twitter,
                              fieldName: "Twitter URL",
                              type: InputType.TEXT,
                              keyboard: TextInputType.text,
                              onChanged: (value) {
                                controller.contactUsDetails.value.twitter =
                                    value;
                              },
                              required: true,
                            ),
                            //Behance URL
                            MyFormField(
                              initialValue:
                                  controller.contactUsDetails.value.behance,
                              fieldName: "Behance URL",
                              type: InputType.TEXT,
                              keyboard: TextInputType.text,
                              onChanged: (value) {
                                controller.contactUsDetails.value.behance =
                                    value;
                              },
                              required: true,
                            ),
                            //Facebook URL
                            MyFormField(
                              initialValue:
                                  controller.contactUsDetails.value.facebook,
                              fieldName: "Facebook URL",
                              type: InputType.TEXT,
                              keyboard: TextInputType.name,
                              onChanged: (value) {
                                controller.contactUsDetails.value.facebook =
                                    value;
                              },
                              required: true,
                            ),
                            //Instagram URL
                            MyFormField(
                              initialValue:
                                  controller.contactUsDetails.value.instagram,
                              fieldName: "Instagram URL",
                              type: InputType.TEXT,
                              keyboard: TextInputType.text,
                              onChanged: (value) {
                                controller.contactUsDetails.value.instagram =
                                    value;
                              },
                              required: true,
                            ),

                            //Whatsapp Number
                            MyFormField(
                              initialValue: controller.contactUsDetails.value
                                  .whatsappNumber?.whatsappNumber!,
                              fieldName: "WhatsApp Number",
                              type: InputType.TEXT,
                              keyboard: TextInputType.phone,
                              onChanged: (value) {
                                controller
                                        .contactUsDetails.value.whatsappNumber =
                                    WhatsAppDetails(
                                        templateId: controller.template.id,
                                        whatsappNumber: value);
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
                        controller.validateAndContinue(context, 7);
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
