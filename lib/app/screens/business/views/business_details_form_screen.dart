import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/ui/image_input.dart';
import '../../../components/ui/my_list_view.dart';
import '../controllers/business_up_controller.dart';
import '../../../components/ui/form_fields.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

// ignore: must_be_immutable
class BusinessDetailFormScreen extends GetView<BusinessController> {
  const BusinessDetailFormScreen({Key? key}) : super(key: key);

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
              text: "Business Detail Form",
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
                    Obx(
                      () => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
                        child: Form(
                          key: controller.businessDetailsFormKey,
                          child: MyListView(
                            children: [
                              SizedBox(
                                height: 20 * fem,
                              ),
                              //Logo
                              Center(
                                child: RoundedContainer(
                                  radius: 0,
                                  height: 100,
                                  width: 100,
                                  child: Stack(
                                    children: [
                                      RoundedContainer(
                                        radius: 50,
                                        borderColor: ColorPallete.primary,
                                        clip: Clip.antiAliasWithSaveLayer,
                                        width: double.infinity,
                                        child: (controller.businessDetails.value
                                                        .logo ??
                                                    "") ==
                                                ""
                                            ? const Center(
                                                child: Icon(
                                                  Icons.photo,
                                                  size: 50,
                                                  color: ColorPallete.primary,
                                                ),
                                              )
                                            : Image.file(
                                                File(controller.businessDetails
                                                    .value.logo!),
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Image.network(
                                                    controller.businessDetails
                                                        .value.logo!,
                                                    fit: BoxFit.fill,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return const Center(
                                                        child: Icon(Icons
                                                            .person_outline),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Center(
                                          child: ImageInput(
                                            callback: (img) {
                                              controller.businessDetails.value
                                                  .logo = img;
                                              controller.businessDetails
                                                  .refresh();
                                            },
                                            child: const CircleAvatar(
                                              backgroundColor:
                                                  ColorPallete.primary,
                                              child: Icon(
                                                Icons.camera_alt_outlined,
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

                              SizedBox(
                                height: 20 * fem,
                              ),
                              //Business Name
                              MyFormField(
                                initialValue:
                                    controller.businessDetails.value.name,
                                fieldName: "Business Name",
                                type: InputType.TEXT,
                                keyboard: TextInputType.name,
                                onChanged: (value) {
                                  controller.businessDetails.value.name = value;
                                },
                                required: true,
                              ),
                              //About Company
                              MyFormField(
                                initialValue:
                                    controller.businessDetails.value.details,
                                fieldName: "About Company",
                                type: InputType.TEXT,
                                keyboard: TextInputType.name,
                                maxLines: 5,
                                onChanged: (value) {
                                  controller.businessDetails.value.details =
                                      value;
                                },
                                required: true,
                              ),
                              // //Introduction / Facts
                              // MyFormField(
                              //   initialValue:
                              //       controller.businessDetails.value.facts,
                              //   fieldName: "Introduction / Facts",
                              //   type: InputType.TEXT,
                              //   maxLines: 5,
                              //   keyboard: TextInputType.name,
                              //   onChanged: (value) {
                              //     controller.businessDetails.value.facts =
                              //         value;
                              //   },
                              //   required: true,
                              // ),
                              // //Introduction / Facts
                              // MyFormField(
                              //   initialValue:
                              //       controller.businessDetails.value.number,
                              //   fieldName: "Contact Number",
                              //   type: InputType.TEXT,
                              //   keyboard: TextInputType.phone,
                              //   onChanged: (value) {
                              //     controller.businessDetails.value.number =
                              //         value;
                              //   },
                              //   required: true,
                              // ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
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
                      if (!controller.isLoading.value) {
                        controller.validateAndContinue(context, 1);
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
