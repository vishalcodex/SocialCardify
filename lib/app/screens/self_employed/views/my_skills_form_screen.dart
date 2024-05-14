import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../models/skill_model.dart';
import '../controllers/self_employed_controller.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

import '../../../components/ui/form_fields.dart';

// ignore: must_be_immutable
class MySkillsFormScreen extends GetView<SelfEmployedController> {
  const MySkillsFormScreen({Key? key}) : super(key: key);

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
              text: "My Skills",
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0 * fem, vertical: 10 * fem),
                        child: controller.skills.isEmpty
                            ? InkWell(
                                onTap: () {
                                  controller.skills.add(Skill(
                                      templateId: controller.template.id));
                                },
                                child: RoundedContainer(
                                  radius: 10,
                                  color: ColorPallete.primary,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15.0 * fem),
                                    child: const Center(
                                      child: TextView(
                                        text: "Add Skill",
                                        color: ColorPallete.theme,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.skills.length,
                                itemBuilder: (context, index) {
                                  Skill skill =
                                      controller.skills.elementAt(index);
                                  return MyListView(
                                    children: [
                                      SizedBox(
                                        height: 10 * fem,
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: TextView(
                                              text: "Skill ${index + 1}",
                                              color: ColorPallete.secondary,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Expanded(
                                            child: Divider(
                                              height: 1 * fem,
                                              thickness: 1 * fem,
                                              color: ColorPallete.grey,
                                            ),
                                          ),
                                          if (index > 0)
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.0 * fem),
                                              child: InkWell(
                                                onTap: () {
                                                  controller.skills
                                                      .removeAt(index);
                                                  controller.skills.refresh();
                                                },
                                                child: const CircleAvatar(
                                                  backgroundColor:
                                                      ColorPallete.red,
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: ColorPallete.theme,
                                                  ),
                                                ),
                                              ),
                                            )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10 * fem,
                                      ),

                                      //Skill Name
                                      MyFormField(
                                        initialValue: skill.name,
                                        fieldName: "Skill",
                                        type: InputType.TEXT,
                                        keyboard: TextInputType.name,
                                        onChanged: (value) {
                                          skill.name = value;
                                        },
                                        required: true,
                                      ),
                                      //Skill Percentage
                                      MyFormField(
                                        initialValue: skill.percentage,
                                        fieldName: "Percentage",
                                        type: InputType.TEXT,
                                        keyboard: TextInputType.number,
                                        onChanged: (value) {
                                          skill.percentage = value;
                                        },
                                        required: true,
                                      ),

                                      if (index ==
                                          (controller.skills.length - 1))
                                        MyListView(
                                          children: [
                                            SizedBox(
                                              height: 10 * fem,
                                            ),
                                            Divider(
                                              height: 1 * fem,
                                              thickness: 1 * fem,
                                              color: ColorPallete.grey,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 20.0 * fem),
                                              child: InkWell(
                                                onTap: () {
                                                  controller.skills.add(Skill(
                                                      templateId: controller
                                                          .template.id));
                                                },
                                                child: RoundedContainer(
                                                  radius: 10,
                                                  color: ColorPallete.primary,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical:
                                                                15.0 * fem),
                                                    child: const Center(
                                                      child: TextView(
                                                        text: "Add Skill",
                                                        color:
                                                            ColorPallete.theme,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                    ],
                                  );
                                },
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
                        controller.validateAndContinue(context, 4);
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
