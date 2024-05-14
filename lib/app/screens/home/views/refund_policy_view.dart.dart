import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class RefundPolicyView extends GetView<HomeController> {
  const RefundPolicyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorPallete.theme,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorPallete.theme),
        backgroundColor: ColorPallete.primary,
        title: const TextView(
          text: "Refund Policy",
          color: ColorPallete.theme,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          body: RoundedContainer(
            radius: 0,
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () {
                      // controller.homeRefresh();
                      return Future.value();
                    },
                    child: MyListView(
                      scroll: true,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0 * fem),
                          child: MyListView(
                            children: [
                              SizedBox(
                                height: 10 * fem,
                              ),
                              // Html(
                              //   data: controller.settings.value.aboutUs!,
                              //   style: {
                              //     "body": Style(color: ColorPallete.secondary)
                              //   },
                              // ),
                              TextView(
                                text:
                                    "Return and Refund Policy  \n========================\n\nLast updated: April 19, 2024\n\nThank you for shopping at Social Cardify.\n\nIf, for any reason, You are not completely satisfied with a purchase We invite\nYou to review our policy on refunds and returns. This Return and Refund Policy\nhas been created with the help of the [Return and Refund Policy\nGenerator](https://www.privacypolicies.com/return-refund-policy-generator/).\n\nThe following terms are applicable for any products that You purchased with\nUs.\n\nInterpretation and Definitions  \n------------------------------\n\nInterpretation  \n~~~~~~~~~~~~~~\n\nThe words of which the initial letter is capitalized have meanings defined\nunder the following conditions. The following definitions shall have the same\nmeaning regardless of whether they appear in singular or in plural.\n\nDefinitions  \n~~~~~~~~~~~\n\nFor the purposes of this Return and Refund Policy:\n\n  * Application means the software program provided by the Company downloaded\n    by You on any electronic device, named Social Cardify\n\n  * Company (referred to as either 'the Company', 'We', 'Us' or 'Our' in this\n    Agreement) refers to Social Cardify.\n\n  * Goods refer to the items offered for sale on the Service.\n\n  * Orders mean a request by You to purchase Goods from Us.\n\n  * Service refers to the Application.\n\n  * You means the individual accessing or using the Service, or the company,    \nor other legal entity on behalf of which such individual is accessing or    \nusing the Service, as applicable.\n\n\nYour Order Cancellation Rights  \n------------------------------\n\nYou are entitled to cancel Your Order within 7 days without giving any reason\nfor doing so.\n\nThe deadline for cancelling an Order is 7 days from the date on which You\nreceived the Goods or on which a third party you have appointed, who is not\nthe carrier, takes possession of the product delivered.\n\nIn order to exercise Your right of cancellation, You must inform Us of your\ndecision by means of a clear statement. You can inform us of your decision by:\n\n  * By email: socialcardify@gmail.com\n\nWe will reimburse You no later than 14 days from the day on which We receive\nthe returned Goods. We will use the same means of payment as You used for the\nOrder, and You will not incur any fees for such reimbursement.\n\nConditions for Returns  \n----------------------\n\nIn order for the Goods to be eligible for a return, please make sure that:n\n  * The Goods were purchased in the last 7 days \n * The Goods are in the original packaging\n\nThe following Goods cannot be returned:\n\n  * The supply of Goods made to Your specifications or clearly personalized. \n * The supply of Goods which according to their nature are not suitable to be   \n returned, deteriorate rapidly or where the date of expiry is over.  \n* The supply of Goods which are not suitable for return due to health    \nprotection or hygiene reasons and were unsealed after delivery.  \n* The supply of Goods which are, after delivery, according to their nature,    \ninseparably mixed with other items.\n\nWe reserve the right to refuse returns of any merchandise that does not meet\nthe above return conditions in our sole discretion.\n\nOnly regular priced Goods may be refunded. Unfortunately, Goods on sale cannot\nbe refunded. This exclusion may not apply to You if it is not permitted by\napplicable law.\n\nReturning Goods  \n---------------\n\nYou are responsible for the cost and risk of returning the Goods to Us. You\nshould send the Goods at the following address:\n\nDargah Peer Khana Word no.20 ,24 ASC new gharsana 335707\n\nWe cannot be held responsible for Goods damaged or lost in return shipment.\nTherefore, We recommend an insured and trackable mail service. We are unable\nto issue a refund without actual receipt of the Goods or proof of received\nreturn delivery.\n\nGifts  \n-----\n\nIf the Goods were marked as a gift when purchased and then shipped directly to\nyou, You'll receive a gift credit for the value of your return. Once the\nreturned product is received, a gift certificate will be mailed to You.\n\nIf the Goods weren't marked as a gift when purchased, or the gift giver had\nthe Order shipped to themselves to give it to You later, We will send the\nrefund to the gift giver.\n\nContact Us  \n~~~~~~~~~~\n\nIf you have any questions about our Returns and Refunds Policy, please contact\nus:\n\n  * By email: socialcardify@gmail.com\n\n",
                                fontSize: 14,
                                color: ColorPallete.secondary,
                              ),
                              SizedBox(
                                height: 10 * fem,
                              ),
                            ],
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
      ),
    );
  }
}
