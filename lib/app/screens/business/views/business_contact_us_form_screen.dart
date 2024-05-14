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
class BusinessContactUsFormScreen extends GetView<BusinessController> {
  const BusinessContactUsFormScreen({Key? key}) : super(key: key);

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
              text: "Business Contact Us Form",
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
                            //Address
                            MyFormField(
                              initialValue:
                                  controller.contactUsDetails.value.address,
                              fieldName: "Address",
                              type: InputType.TEXT,
                              keyboard: TextInputType.name,
                              onChanged: (value) {
                                controller.contactUsDetails.value.address =
                                    value;
                              },
                              required: true,
                            ),
                            //Phone Number
                            MyFormField(
                              initialValue:
                                  controller.contactUsDetails.value.phoneNumber,
                              fieldName: "Phone Number",
                              type: InputType.TEXT,
                              keyboard: TextInputType.phone,
                              onChanged: (value) {
                                controller.contactUsDetails.value.phoneNumber =
                                    value;
                              },
                              required: true,
                            ),
                            //Email Id
                            MyFormField(
                              initialValue:
                                  controller.contactUsDetails.value.email,
                              fieldName: "Email Id",
                              type: InputType.TEXT,
                              keyboard: TextInputType.emailAddress,
                              onChanged: (value) {
                                controller.contactUsDetails.value.email = value;
                              },
                              required: true,
                            ),
                            //Whatsapp Number
                            MyFormField(
                              initialValue: controller.contactUsDetails.value
                                  .whatsAppNumber?.whatsappNumber,
                              fieldName: "Whatsapp Number",
                              type: InputType.TEXT,
                              keyboard: TextInputType.phone,
                              onChanged: (value) {
                                controller.contactUsDetails.value
                                    .whatsAppNumber!.whatsappNumber = value;
                              },
                              required: true,
                            ),

                            //Facebook URL
                            MyFormField(
                              initialValue:
                                  controller.contactUsDetails.value.facebook,
                              fieldName: "Facebook URL",
                              type: InputType.TEXT,
                              keyboard: TextInputType.text,
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
                            //Contact Person Name
                            MyFormField(
                              initialValue: controller
                                  .contactUsDetails.value.contactPerson,
                              fieldName: "Contact Person Name",
                              type: InputType.TEXT,
                              keyboard: TextInputType.name,
                              onChanged: (value) {
                                controller.contactUsDetails.value
                                    .contactPerson = value;
                              },
                              required: true,
                            ),
                            //Contact Person Phone Number
                            MyFormField(
                              initialValue: controller
                                  .contactUsDetails.value.contactNumber,
                              fieldName: "Contact Person Phone Number",
                              type: InputType.TEXT,
                              keyboard: TextInputType.phone,
                              onChanged: (value) {
                                controller.contactUsDetails.value
                                    .contactNumber = value;
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
