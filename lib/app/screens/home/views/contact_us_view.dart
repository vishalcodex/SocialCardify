import 'package:flutter/services.dart';

import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../providers/api_endpoints.dart';
import '../../../services/auth_service.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class ContactUsView extends GetView<HomeController> {
  const ContactUsView({Key? key}) : super(key: key);
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
          // appBar: PreferredSize(
          //     preferredSize: Size.fromHeight(50.0 * fem),
          //     child: CustomHomeAppBar(
          //       drawerContext: context,
          //       pageName: "",
          //     )),
          body: RoundedContainer(
            radius: 0,
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: MyListView(
                    scroll: true,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0 * fem),
                        child: MyListView(
                          children: [
                            SizedBox(
                              height: 10 * fem,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundedContainer(
                                  radius: 150,
                                  height: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset("assets/ui/logo.png"),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50 * fem,
                            ),
                            const RoundedContainer(
                              radius: 0,
                              child: TextView(
                                text: "Social Cardify Self Identify",
                                color: ColorPallete.primary,
                                fontSize: 20,
                                alignment: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 10 * fem,
                            ),
                            const EntryWidget(
                              icon: Icon(
                                Icons.location_on,
                                color: ColorPallete.secondary,
                                size: 40,
                              ),
                              value: "Address",
                            ),
                            const EntryWidget(
                              icon: Icon(
                                Icons.phone,
                                color: ColorPallete.secondary,
                                size: 40,
                              ),
                              value: "+91 7230000408",
                            ),
                            const EntryWidget(
                              icon: Icon(
                                Icons.mail,
                                color: ColorPallete.secondary,
                                size: 40,
                              ),
                              value: "contactus@socialcardify.com",
                            ),
                            // const EntryWidget(
                            //   icon: Icon(
                            //     Icons.whatsapp,
                            //     color: ColorPallete.secondary,
                            //     size: 40,
                            //   ),
                            //    value: "+91 7230000408",
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EntryWidget extends StatelessWidget {
  final Widget icon;
  final String value;
  const EntryWidget({super.key, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10 * fem),
      child: MyListView(
        children: [
          Center(child: icon),
          InkWell(
            onLongPress: () async {
              await Clipboard.setData(ClipboardData(
                      text:
                          "${Urls.baseUrl}website/${Get.find<AuthService>().user.value.username}"))
                  .then((value) {
                // log("${Urls.baseUrl}website/${Get.find<AuthService>().user.value.username}");
                Get.showSnackbar(
                  const GetSnackBar(
                    backgroundColor: ColorPallete.primary,
                    duration: Duration(seconds: 3),
                    message: "Text copied to Clipboard",
                  ),
                );
              });
            },
            child: Padding(
              padding: EdgeInsets.all(5.0 * fem),
              child: TextView(
                text: value,
                color: ColorPallete.secondary,
                fontSize: 16,
                alignment: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
