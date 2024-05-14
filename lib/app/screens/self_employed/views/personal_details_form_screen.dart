import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/ui/image_input.dart';
import '../../../components/ui/my_list_view.dart';
import '../controllers/self_employed_controller.dart';

import '../../../components/ui/form_fields.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

// ignore: must_be_immutable
class PersonalDetailFormScreen extends GetView<SelfEmployedController> {
  const PersonalDetailFormScreen({Key? key}) : super(key: key);

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
              text: "Personal Details Form",
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
                                        child: (controller.personalDetails.value
                                                        .photo ??
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
                                                File(controller.personalDetails
                                                    .value.photo!),
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Image.network(
                                                    controller.personalDetails
                                                        .value.photo!,
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
                                              controller.personalDetails.value
                                                  .photo = img;
                                              controller.personalDetails
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
                              //About Company
                              MyFormField(
                                initialValue: controller
                                    .personalDetails.value.aboutDescription,
                                fieldName: "About Description",
                                type: InputType.TEXT,
                                keyboard: TextInputType.text,
                                maxLines: 4,
                                onChanged: (value) {
                                  controller.personalDetails.value
                                      .aboutDescription = value;
                                },
                                required: true,
                              ),
                              //Career Objective
                              MyFormField(
                                initialValue: controller
                                    .personalDetails.value.careerObjective,
                                fieldName: "Carrer Objective",
                                type: InputType.TEXT,
                                keyboard: TextInputType.text,
                                maxLines: 3,
                                onChanged: (value) {
                                  controller.personalDetails.value
                                      .careerObjective = value;
                                },
                                required: true,
                              ),
                              //Email
                              MyFormField(
                                initialValue:
                                    controller.personalDetails.value.email,
                                fieldName: "Email",
                                type: InputType.TEXT,
                                keyboard: TextInputType.emailAddress,
                                onChanged: (value) {
                                  controller.personalDetails.value.email =
                                      value;
                                },
                                required: true,
                              ),

                              Row(
                                children: [
                                  //Gender
                                  Expanded(
                                    child: MyFormField(
                                      initialValue: controller
                                          .personalDetails.value.gender,
                                      fieldName: "Gender",
                                      type: InputType.DROP_DOWN,
                                      dropDownOptions: const [
                                        "Male",
                                        "Female",
                                        "Other"
                                      ],
                                      keyboard: TextInputType.text,
                                      onChanged: (value) {
                                        controller.personalDetails.value
                                            .gender = value;
                                      },
                                      required: true,
                                    ),
                                  ), //DOB
                                  Expanded(
                                    child: MyFormField(
                                      initialValue:
                                          controller.personalDetails.value.dob,
                                      fieldName: "DOB",
                                      type: InputType.DATE,
                                      keyboard: TextInputType.text,
                                      onChanged: (value) {
                                        controller.personalDetails.value.dob =
                                            value;
                                      },
                                      required: true,
                                    ),
                                  ),
                                ],
                              ),
                              //Education
                              MyFormField(
                                initialValue:
                                    controller.personalDetails.value.education,
                                fieldName: "Education",
                                type: InputType.TEXT,
                                keyboard: TextInputType.text,
                                onChanged: (value) {
                                  controller.personalDetails.value.education =
                                      value;
                                },
                                required: true,
                              ),
                              //Phone Number
                              MyFormField(
                                initialValue: controller
                                    .personalDetails.value.phoneNumber,
                                fieldName: "Phone Number",
                                type: InputType.TEXT,
                                keyboard: TextInputType.phone,
                                onChanged: (value) {
                                  controller.personalDetails.value.phoneNumber =
                                      value;
                                },
                                required: true,
                              ),
                              //Maritial Status
                              MyFormField(
                                initialValue: controller
                                    .personalDetails.value.maritalStatus,
                                fieldName: "Maritial Status",
                                type: InputType.DROP_DOWN,
                                dropDownOptions: const ["Single", "Married"],
                                keyboard: TextInputType.text,
                                onChanged: (value) {
                                  controller.personalDetails.value
                                      .maritalStatus = value;
                                },
                                required: true,
                              ),
                              SizedBox(
                                height: 10 * fem,
                              ),
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
                                    text: controller.selectedTile.value > 4
                                        ? translations.submit.tr
                                        : translations.next.tr,
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
