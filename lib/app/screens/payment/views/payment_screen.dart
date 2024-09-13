import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/payment_controller.dart';

// ignore: must_be_immutable
class PaymentScreen extends GetView<PaymentController> {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorPallete.theme),
        backgroundColor: ColorPallete.primary,
        // leading: InkWell(
        //   onTap: () {
        //     controller.scaffoldKey.currentState!.openDrawer();
        //   },
        //   child: const Icon(
        //     Icons.menu,
        //     color: ColorPallete.primary,
        //   ),
        // ),
        title: const TextView(
          text: "Payments",
          color: ColorPallete.theme,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: MyListView(
                scroll: true,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0 * fem),
                    child: MyListView(
                      children: [
                        const TextView(
                          text: "Template Selected",
                          color: ColorPallete.secondary,
                          fontSize: 18,
                          weight: FontWeight.w700,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10 * fem),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 2.5,
                                  color: ColorPallete.grey.withOpacity(0.5),
                                  offset: Offset(0, 5 * fem),
                                )
                              ]),
                          child: RoundedContainer(
                            radius: 10,
                            color: ColorPallete.theme,
                            child: Padding(
                              padding: EdgeInsets.all(15.0 * fem),
                              child: TextView(
                                text: controller.template.name!,
                                color: ColorPallete.secondary,
                                // font: "Inter",
                                weight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const TextView(
                          text: "Oredr Summary",
                          color: ColorPallete.secondary,
                          fontSize: 18,
                          weight: FontWeight.w700,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10 * fem),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 2.5,
                                  color: ColorPallete.grey.withOpacity(0.5),
                                  offset: Offset(0, 5 * fem),
                                )
                              ]),
                          child: RoundedContainer(
                            radius: 10,
                            color: ColorPallete.theme,
                            child: Padding(
                              padding: EdgeInsets.all(15.0 * fem),
                              child: MyListView(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const TextView(
                                        text: "Plan Selected",
                                        color: ColorPallete.grey,
                                        // font: "Inter",
                                        weight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                      TextView(
                                        text: "₹ ${controller.template.cost}",
                                        color: ColorPallete.grey,
                                        // font: "Inter",
                                        weight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const TextView(
                                        text: "18% GST",
                                        color: ColorPallete.grey,
                                        // font: "Inter",
                                        weight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                      TextView(
                                        text:
                                            "₹ ${double.parse(controller.template.cost ?? "0.0") * 0.18}",
                                        color: ColorPallete.grey,
                                        // font: "Inter",
                                        weight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const TextView(
                                        text: "Total Payable",
                                        color: ColorPallete.secondary,
                                        // font: "Inter",
                                        weight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      TextView(
                                        text:
                                            "₹ ${double.parse(controller.template.cost ?? "0.0") * 1.18}",
                                        color: ColorPallete.secondary,
                                        // font: "Inter",
                                        weight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Obx(
                          () => InkWell(
                            onTap: () {
                              controller.payWith.value =
                                  !controller.payWith.value;
                              controller.payWith.refresh();
                            },
                            child: RoundedContainer(
                              radius: 10,
                              color: ColorPallete.primary,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      controller.payWith.value
                                          ? Icons.check_box
                                          : Icons.square,
                                      color: ColorPallete.theme,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const TextView(
                                      text:
                                          "Pay with Cards / UPI / Net Banking",
                                      color: ColorPallete.theme,
                                      fontSize: 14,
                                      weight: FontWeight.w600,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  if (!controller.isLoading.value) {
                    controller.isLoading.value = false;
                    controller.payNow();
                  }
                },
                child: RoundedContainer(
                  radius: 20,
                  color: ColorPallete.primary,
                  child: Center(
                    child: Obx(
                      () => controller.isLoading.value
                          ? const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: CircularProgressIndicator(
                                color: ColorPallete.theme,
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: TextView(
                                text: "Pay Now",
                                color: ColorPallete.theme,
                                fontSize: 16,
                                weight: FontWeight.bold,
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
    );
  }
}
