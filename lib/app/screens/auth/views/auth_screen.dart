import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/text_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';
import '../controller/auth_controller.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          resizeToAvoidBottomInset: true,
          body: Column(children: [
            Expanded(
              child: MyListView(
                scroll: true,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.0 * fem, vertical: 20 * fem),
                    child: MyListView(
                      children: [
                        Image.asset(
                          "assets/ui/otp1.jpg",
                          height: MediaQuery.of(context).size.height * 0.30,
                        ),
                        SizedBox(
                          height: 20 * fem,
                        ),
                        Center(
                          child: TextView(
                            text: translations.welcome.tr,
                            color: ColorPallete.secondary,
                            fontSize: 18,
                            weight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20 * fem,
                        ),
                        Center(
                          child: TextView(
                            text: translations.enterNumberToContinue.tr,
                            color: ColorPallete.secondary,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 20 * fem,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          cursorColor: ColorPallete.secondary,
                          decoration: const InputDecoration().copyWith(
                            labelText: translations.phoneNumber.tr,
                            labelStyle: const TextStyle(
                                fontSize: 14, color: ColorPallete.secondary),
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorPallete.secondary),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorPallete.secondary),
                            ),
                          ),
                          onChanged: (value) {
                            controller.user.value.phoneNumber = value;
                          },
                        ),
                        SizedBox(
                          height: 20 * fem,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
                          child: TextView(
                            text: translations.sixDigitOtp.tr,
                            color: ColorPallete.secondary,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 20 * fem,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => Checkbox(
                                value: controller.agreeTermsNConditions.value,
                                onChanged: (value) {
                                  controller.agreeTermsNConditions.value =
                                      !controller.agreeTermsNConditions.value;
                                },
                              ),
                            ),
                            const TextView(
                              text: "I Agree to,",
                              fontSize: 14,
                              color: ColorPallete.secondary,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const TextView(
                                text: "Terms of Service",
                                fontSize: 14,
                                hasUnderline: true,
                              ),
                            ),
                            SizedBox(
                              width: 5 * fem,
                            ),
                            const TextView(
                              text: " and ",
                              fontSize: 14,
                              color: ColorPallete.secondary,
                            ),
                            SizedBox(
                              width: 5 * fem,
                            ),
                            InkWell(
                              onTap: () {},
                              child: const TextView(
                                text: "Privacy Policy",
                                fontSize: 14,
                                hasUnderline: true,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30 * fem,
                        ),
                        InkWell(
                          onTap: () {
                            if (!controller.isLoading.value) {
                              controller.hasAgreedTerms();
                            }
                          },
                          child: RoundedContainer(
                            radius: 10,
                            height: 50,
                            color: ColorPallete.primary,
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: 10.0 * fem),
                              child: Obx(
                                () => controller.isLoading.value
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: ColorPallete.theme,
                                        ),
                                      )
                                    : Center(
                                        child: TextView(
                                          text: translations.sendOtp.tr,
                                          fontSize: 16,
                                          color: ColorPallete.theme,
                                        ),
                                      ),
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
          ]),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = ColorPallete.primary;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.10);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * 0.50);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
