import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class MyReferralsView extends GetView<HomeController> {
  const MyReferralsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorPallete.theme,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          body: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () {
                    // controller.updateUser();
                    controller.fetchMyReferrals();
                    return Future.value();
                  },
                  child: MyListView(
                    scroll: true,
                    children: [
                      Obx(
                        () => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0 * fem, vertical: 15 * fem),
                          child: MyListView(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.0 * fem,
                                ),
                                child: RoundedContainer(
                                  radius: 0,
                                  child: MyListView(
                                    children: [
                                      const TextView(
                                        text: "My Referral Code",
                                        color: ColorPallete.secondary,
                                        fontSize: 16,
                                      ),
                                      SizedBox(
                                        height: 10 * fem,
                                      ),
                                      RoundedContainer(
                                        radius: 10,
                                        color: ColorPallete.primary
                                            .withOpacity(0.1),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0 * fem,
                                              vertical: 10 * fem),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 5 * fem,
                                              ),
                                              Expanded(
                                                child: TextView(
                                                  text: controller.user.value
                                                              .referralCode ==
                                                          ""
                                                      ? "NA"
                                                      : controller.user.value
                                                          .referralCode!,
                                                  color: ColorPallete.primary,
                                                  fontSize: 16,
                                                  maxlines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  weight: FontWeight.w700,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Clipboard.setData(ClipboardData(
                                                          text: controller
                                                                  .user
                                                                  .value
                                                                  .referralCode ??
                                                              ""))
                                                      .then((value) {
                                                    Get.showSnackbar(
                                                        const GetSnackBar(
                                                      duration:
                                                          Duration(seconds: 3),
                                                      message:
                                                          "Code copied to clipboard !",
                                                    ));
                                                  });
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5 * fem),
                                                  child: const Icon(
                                                    Icons.copy,
                                                    color: ColorPallete.primary,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15 * fem,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Share.share(
                                            "My referral code for Social Cardify is ${controller.user.value.referralCode}",
                                          );
                                        },
                                        child: RoundedContainer(
                                          radius: 10,
                                          color: ColorPallete.primary,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15.0 * fem),
                                            child: const Center(
                                              child: TextView(
                                                text: "SHARE",
                                                color: ColorPallete.theme,
                                                weight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0 * fem),
                                        child: Divider(
                                          thickness: 1 * fem,
                                          color: ColorPallete.grey,
                                        ),
                                      ),
                                      const TextView(
                                        text: "My Earnings *",
                                        color: ColorPallete.secondary,
                                        fontSize: 16,
                                      ),
                                      SizedBox(
                                        height: 10 * fem,
                                      ),
                                      RoundedContainer(
                                        radius: 10,
                                        color: ColorPallete.primary
                                            .withOpacity(0.1),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0 * fem,
                                              vertical: 15 * fem),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 5 * fem,
                                              ),
                                              Expanded(
                                                child: TextView(
                                                  text: (controller
                                                                  .myReferral
                                                                  .value
                                                                  .totalCommission ??
                                                              "") ==
                                                          ""
                                                      ? "N/A"
                                                      : "₹ ${controller.myReferral.value.totalCommission} /-",
                                                  color: ColorPallete.primary,
                                                  fontSize: 16,
                                                  maxlines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  weight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5 * fem,
                                      ),
                                      const TextView(
                                          text:
                                              "*A minimum withdrawal amount is ₹1,000/-"),
                                      SizedBox(
                                        height: 15 * fem,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // Share.share(
                                          //   "${controller.user.value.referralCode}",
                                          // );
                                          if (double.parse(controller.myReferral
                                                      .value.totalCommission ??
                                                  "0.0") <
                                              1000) {
                                            Get.showSnackbar(const GetSnackBar(
                                              backgroundColor: ColorPallete.red,
                                              duration: Duration(seconds: 3),
                                              message:
                                                  "Insufficient balance for withdrawal !\nMinimum of ₹1,000 earnings necessary for withdrawal.",
                                            ));
                                          }
                                        },
                                        child: RoundedContainer(
                                          radius: 10,
                                          color: ColorPallete.primary,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15.0 * fem),
                                            child: const Center(
                                              child: TextView(
                                                text: "Withdraw",
                                                color: ColorPallete.theme,
                                                weight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0 * fem),
                                        child: Divider(
                                          thickness: 1 * fem,
                                          color: ColorPallete.grey,
                                        ),
                                      ),
                                      TextView(
                                        text:
                                            "My Referrals (${controller.myReferral.value.referrals?.length ?? 0})",
                                        color: ColorPallete.secondary,
                                        fontSize: 16,
                                      ),
                                      SizedBox(
                                        height: 10 * fem,
                                      ),
                                      controller.isLoading.value
                                          ? const SizedBox(
                                              height: 200,
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: ColorPallete.primary,
                                                ),
                                              ),
                                            )
                                          : (controller.myReferral.value
                                                          .referrals ??
                                                      [])
                                                  .isEmpty
                                              ? const SizedBox(
                                                  height: 200,
                                                  child: Center(
                                                      child: TextView(
                                                          text:
                                                              "No Referrals")),
                                                )
                                              : MyListView(
                                                  children: (controller
                                                              .myReferral
                                                              .value
                                                              .referrals ??
                                                          [])
                                                      .map((e) {
                                                    return MyListView(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0 * fem),
                                                          child:
                                                              RoundedContainer(
                                                            radius: 10,
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      TextView(
                                                                    text:
                                                                        e.referralName ??
                                                                            "",
                                                                    fontSize:
                                                                        14,
                                                                    color: ColorPallete
                                                                        .secondary,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                ),
                                                                TextView(
                                                                  text:
                                                                      "₹ ${e.referralCommission ?? "0.0"} /-",
                                                                  fontSize: 14,
                                                                  color: ColorPallete
                                                                      .secondary,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 1 * fem,
                                                          color:
                                                              ColorPallete.grey,
                                                        ),
                                                      ],
                                                    );
                                                  }).toList(),
                                                )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
