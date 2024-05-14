import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/membership_controller.dart';
// import '../../../../../../../common/transalations/translation_keys.dart'
//     as translations;

// ignore: must_be_immutable
class MemebrshipScreen extends GetView<MembershipController> {
  const MemebrshipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: RefreshIndicator(
              onRefresh: () {
                controller.refreshView();
                return Future.value();
              },
              child: MyListView(
                scroll: true,
                children: [
                  MyListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0 * fem, horizontal: 10 * fem),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10 * fem),
                              color: Colors.transparent,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    spreadRadius: 2.5,
                                    color: ColorPallete.grey.withOpacity(0.5),
                                    offset: Offset(0, 5 * fem))
                              ]),
                          child: RoundedContainer(
                            radius: 10,
                            color: ColorPallete.theme,
                            borderColor: ColorPallete.grey.withOpacity(0.2),
                            child: Padding(
                              padding: EdgeInsets.all(10.0 * fem),
                              child: Obx(
                                () => (controller.template.value.name ?? "") ==
                                        ""
                                    ? controller.isLoading.value
                                        ? const SizedBox(
                                            height: 150,
                                            child: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          )
                                        : SizedBox(
                                            height: 200 * fem,
                                            child: const Center(
                                              child: TextView(
                                                text:
                                                    "Please Purchase a template to view Membership Details",
                                                fontSize: 16,
                                                color: ColorPallete.secondary,
                                                alignment: TextAlign.center,
                                              ),
                                            ),
                                          )
                                    : MyListView(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.0 * fem),
                                            child: TextView(
                                              text: controller
                                                  .template.value.name!,
                                              fontSize: 16,
                                              color: ColorPallete.secondary,
                                              weight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10 * fem,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.0 * fem),
                                            child: TextView(
                                              text: controller
                                                  .template.value.description!,
                                              fontSize: 12,
                                              color: ColorPallete.grey,
                                              weight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10 * fem,
                                          ),
                                          DataEntry(
                                            title: "Amount",
                                            value:
                                                "₹ ${controller.template.value.cost}/-",
                                          ),
                                          DataEntry(
                                            title: "Payment Id",
                                            value: controller
                                                .paymentReport.value.paymentId!
                                                .toString(),
                                          ),
                                          DataEntry(
                                            title: "Membership Id",
                                            value: controller
                                                .paymentReport.value.id
                                                .toString(),
                                          ),
                                          DataEntry(
                                            title: "Renewal Date",
                                            value: controller
                                                .paymentReport.value.renewalAt!
                                                .split(" ")
                                                .first
                                                .toString(),
                                          ),
                                          SizedBox(
                                            height: 5 * fem,
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Html(
                        data: controller.content.value,
                        style: {"body": Style(color: ColorPallete.secondary)},
                      ),
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class DataEntry extends StatelessWidget {
  final String title;
  final String value;
  const DataEntry({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return RoundedContainer(
      radius: 0,
      height: 30,
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextView(
                  text: title,
                  fontSize: 16,
                  color: ColorPallete.secondary,
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextView(
                  text: value,
                  fontSize: 18,
                  weight: FontWeight.bold,
                ),
                SizedBox(
                  width: 10 * fem,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
