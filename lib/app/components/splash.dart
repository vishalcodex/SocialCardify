import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../common/color_pallete.dart';
import '../routes/app_routes.dart';
import 'ui/my_list_view.dart';
import 'ui/text_view.dart';
import '../../common/transalations/translation_keys.dart' as translations;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final Shader linearGradient = LinearGradient(
  //   colors: <Color>[Ui.parseColor("#FFA36F"), Ui.parseColor("#FF659C")],
  // ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  bool showAuthOptions = false;
  bool showLangOptions = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // if (Get.find<AuthService>().token == null ||
      //     Get.find<AuthService>().token == "") {
      //   setState(() {
      //     showAuthOptions = true;
      //     showLangOptions = true;
      //   });
      // } else {
      // }
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarColor: ColorPallete.primary,
        ),
      );
      Get.offAndToNamed(Routes.HOME);
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // Future.delayed(const Duration(seconds: 6), () {
    //   if (showAuthOptions && showLangOptions) {
    //     // showAuthOptions = false;
    //     showLangOptions = false;
    //     showLanguagePopUp(context);
    //   }
    // });

    return Scaffold(
      backgroundColor: ColorPallete.theme,
      body: Container(
        color: ColorPallete.theme,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0 * fem),
                      child: AnimatedContainer(
                        height: 250 * fem,
                        duration: const Duration(seconds: 2),
                        child: Image.asset(
                          "assets/ui/logo.png",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 25 * fem,
                  // ),

                  // const Center(
                  //   child: TextView(
                  //     text: "Social Cardify",
                  //     color: ColorPallete.secondary,
                  //     fontSize: 24,
                  //     weight: FontWeight.bold,
                  //     alignment: TextAlign.center,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10 * fem,
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 20.0 * fem),
                  //   child: AnimatedContainer(
                  //     height: showAuthOptions ? 110 * fem : 0,
                  //     duration: const Duration(seconds: 2),
                  //     child: MyListView(
                  //       children: [
                  //         InkWell(
                  //           onTap: () {
                  //             Get.offAndToNamed(
                  //               Routes.LOGIN,
                  //             );
                  //           },
                  //           child: RoundedContainer(
                  //             radius: 10,
                  //             height: 50,
                  //             color: ColorPallete.primary,
                  //             child: Center(
                  //               child: Padding(
                  //                 padding: EdgeInsets.symmetric(
                  //                     vertical: 15.0 * fem),
                  //                 child: TextView(
                  //                   text: translations.alreadyAMember.tr,
                  //                   color: ColorPallete.theme,
                  //                   fontSize: 14,
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           height: 10 * fem,
                  //         ),
                  //         InkWell(
                  //           onTap: () {
                  //             Get.offAndToNamed(Routes.AUTH,
                  //                 arguments: {"toLogin": false});
                  //           },
                  //           child: RoundedContainer(
                  //             radius: 10,
                  //             height: 50,
                  //             color: ColorPallete.primary,
                  //             child: Center(
                  //               child: Padding(
                  //                 padding: EdgeInsets.symmetric(
                  //                     vertical: 15.0 * fem),
                  //                 child: TextView(
                  //                   text: translations.registerAsMember.tr,
                  //                   color: ColorPallete.theme,
                  //                   fontSize: 14,
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10 * fem,
                  // ),
                ],
              ),
            ),
            // Image.asset(
            //   "assets/ui/splash.jpg",
            //   height: MediaQuery.of(context).size.height * 0.25,
            //   width: double.infinity,
            //   fit: BoxFit.fill,
            // )
          ],
        ),
      ),
    );
  }

  void showLanguagePopUp(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: MyListView(
              children: [
                const Center(
                  child: TextView(
                    text: "Choose Language",
                    color: ColorPallete.primary,
                    fontSize: 16,
                    weight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15 * fem,
                ),
                SizedBox(
                  height: 100 * fem,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                            Get.updateLocale(const Locale("en", "EN"))
                                .then((value) async {
                              await GetStorage().write("lang", "en");
                            });
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/ui/english.png",
                                height: 80 * fem,
                                width: 80 * fem,
                                color: Color(0xff6e61b7),
                              ),
                              const Spacer(),
                              Center(
                                child: TextView(
                                  text: translations.eng.tr,
                                  color: ColorPallete.primary,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                            Get.updateLocale(const Locale("mr", "MAR"))
                                .then((value) async {
                              await GetStorage().write("lang", "mr");
                            });
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Image.asset(
                                    "assets/ui/marathi.png",
                                    height: 65 * fem,
                                    width: 65 * fem,
                                    // color: Color(0xff6e61b7),
                                  ),
                                ),
                              ),
                              Center(
                                child: TextView(
                                  text: translations.mar.tr,
                                  color: ColorPallete.primary,
                                  fontSize: 14,
                                ),
                              )
                            ],
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
      },
    );
  }
}
