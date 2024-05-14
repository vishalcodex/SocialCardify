import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class TermsNConditionView extends GetView<HomeController> {
  const TermsNConditionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorPallete.theme,
      appBar: PreferredSize(
        preferredSize: Size(0, 50 * fem),
        child: AppBar(
          iconTheme: const IconThemeData(color: ColorPallete.theme),
          backgroundColor: ColorPallete.primary,
          title: const TextView(
            text: "Terms & Conditions",
            color: ColorPallete.theme,
            fontSize: 18,
            weight: FontWeight.bold,
          ),
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
                              //   data: controller
                              //       .settings.value.termsAndConditions!,
                              //   style: {
                              //     "body": Style(color: ColorPallete.secondary)
                              //   },
                              // ),
                              const TextView(
                                text:
                                    "Welcome to Social Cardify!\n\n\n\n\nThese terms and conditions outline the rules and regulations for the use of Social Cardify, located at .\n\n\n\n\nBy accessing this website we assume you accept these terms and conditions. Do not continue to use Social Cardify if you do not agree to take all of the terms and conditions stated on this page.\n\n\n\n\nThe following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: 'Client', 'You' and 'Your' refers to you, the person log on this website and compliant to the Company’s terms and conditions. 'The Company', 'Ourselves', 'We', 'Our' and 'Us', refers to our Company. 'Party', 'Parties', or 'Us', refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client’s needs in respect of provision of the Company’s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.\n\n\n\n\nCookies\n\nWe employ the use of cookies. By accessing Social Cardify, you agreed to use cookies in agreement with the Social Cardify's Privacy Policy.\n\n\n\n\nMost interactive websites use cookies to let us retrieve the user’s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.\n\n\n\n\nLicense\n\nUnless otherwise stated, Social Cardify and/or its licensors own the intellectual property rights for all material on Social Cardify. All intellectual property rights are reserved. You may access this from Social Cardify for your own personal use subjected to restrictions set in these terms and conditions.\n\n\n\n\nYou must not:\n\n\n\n\nRepublish material from Social Cardify\n\nSell, rent or sub-license material from Social Cardify\n\nReproduce, duplicate or copy material from Social Cardify\n\nRedistribute content from Social Cardify\n\nThis Agreement shall begin on the date hereof. Our Terms and Conditions were created with the help of the Free Terms and Conditions Generator.\n\n\n\n\nParts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. Social Cardify does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of Social Cardify,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, Social Cardify shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.\n\n\n\n\nSocial Cardify reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.\n\n\n\n\nYou warrant and represent that:\n\n\n\n\nYou are entitled to post the Comments on our website and have all necessary licenses and consents to do so;\n\n\n\n\nThe Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party;\n\nThe Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy\n\nThe Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.\n\nYou hereby grant Social Cardify a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.\n\n\n\nHyperlinking to our Content\n\nThe following organizations may link to our Website without prior written approval:\n\n\n\n\nGovernment agencies;\n\nSearch engines;\n\nNews organizations;\n\nOnline directory distributors may link to our Website in the same manner as they hyperlink to the Websites of other listed businesses; and\n\nSystem wide Accredited Businesses except soliciting non-profit organizations, charity shopping malls, and charity fundraising groups which may not hyperlink to our Web site.\n\nThese organizations may link to our home page, to publications or to other Website information so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products and/or services; and (c) fits within the context of the linking party’s site.\n\n\n\n\nWe may consider and approve other link requests from the following types of organizations:\n\n\n\n\ncommonly-known consumer and/or business information sources;\n\ndot.com community sites;\n\nassociations or other groups representing charities;\n\nonline directory distributors;\n\ninternet portals;\n\naccounting, law and consulting firms; and\n\neducational institutions and trade associations.\n\nWe will approve link requests from these organizations if we decide that: (a) the link would not make us look unfavorably to ourselves or to our accredited businesses; (b) the organization does not have any negative records with us; (c) the benefit to us from the visibility of the hyperlink compensates the absence of Social Cardify; and (d) the link is in the context of general resource information.\n\n\n\n\nThese organizations may link to our home page so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products or services; and (c) fits within the context of the linking party’s site.\n\n\n\n\nIf you are one of the organizations listed in paragraph 2 above and are interested in linking to our website, you must inform us by sending an e-mail to Social Cardify. Please include your name, your organization name, contact information as well as the URL of your site, a list of any URLs from which you intend to link to our Website, and a list of the URLs on our site to which you would like to link. Wait 2-3 weeks for a response.\n\n\n\n\nApproved organizations may hyperlink to our Website as follows:\n\n\n\n\nBy use of our corporate name; or\n\n\n\n\nBy use of the uniform resource locator being linked to; or\n\n\n\n\nBy use of any other description of our Website being linked to that makes sense within the context and format of content on the linking party’s site.\n\nNo use of Social Cardify's logo or other artwork will be allowed for linking absent a trademark license agreement.\n\n\n\n\niFrames\n\nWithout prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our Website.\n\n\n\n\nContent Liability\n\nWe shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that is rising on your Website. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.\n\n\n\n\nYour Privacy\n\nPlease read Privacy Policy\n\n\n\n\nReservation of Rights\n\nWe reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it’s linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.\n\n\n\n\nRemoval of links from our website\n\nIf you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.\n\n\n\n\nWe do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.\n\n\n\n\nDisclaimer\n\nTo the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:\n\n\n\n\nlimit or exclude our or your liability for death or personal injury;\n\nlimit or exclude our or your liability for fraud or fraudulent misrepresentation;\n\nlimit any of our or your liabilities in any way that is not permitted under applicable law; or\n\nexclude any of our or your liabilities that may not be excluded under applicable law.\n\nThe limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.\n\n\n\n\nAs long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.\n\n\n\n\nAt a time, only one offer is considered valid.",
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
