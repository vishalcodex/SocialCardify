import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class FAQView extends GetView<HomeController> {
  const FAQView({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> faq = const [
    {
      "topic": "Registration",
      "qna": [
        {
          "q":
              "It's completely free! There is no cost to join with a Standard Membership.",
          "a":
              "Yes, purchased vehicles can be registered in the Inida as long as as ownership documents vehicle is sold with allow to do so. Please make yourself aware of any guidelines or requirements for this before you make a purchase."
        },
        {
          "q":
              "Why it takes so long to receive title from a dealer or from an auction?",
          "a":
              "It usually takes around five to ten days to get the title from an auction or a dealer. A seller has a thirty days rule during which he can provide the title of the car to the auction. If the car was under finance, the bank will hold the title of the car for the seller."
        },
        {
          "q": "What does a salvage title mean?",
          "a":
              "Yes, purchased vehicles can be registered in the Inida as long as as ownership documents vehicle is sold with allow to do so. Please make yourself aware of any guidelines or requirements for this before you make a purchase."
        },
      ]
    },
    {
      "topic": "Documents",
      "qna": [
        {
          "q":
              "It's completely free! There is no cost to join with a Standard Membership.",
          "a":
              "Yes, purchased vehicles can be registered in the Inida as long as as ownership documents vehicle is sold with allow to do so. Please make yourself aware of any guidelines or requirements for this before you make a purchase."
        },
        {
          "q":
              "Why it takes so long to receive title from a dealer or from an auction?",
          "a":
              "It usually takes around five to ten days to get the title from an auction or a dealer. A seller has a thirty days rule during which he can provide the title of the car to the auction. If the car was under finance, the bank will hold the title of the car for the seller."
        },
        {
          "q": "What does a salvage title mean?",
          "a":
              "Yes, purchased vehicles can be registered in the Inida as long as as ownership documents vehicle is sold with allow to do so. Please make yourself aware of any guidelines or requirements for this before you make a purchase."
        },
      ]
    },
    {
      "topic": "Where are your vehicles located?",
      "qna": [
        {
          "q":
              "It's completely free! There is no cost to join with a Standard Membership.",
          "a":
              "Yes, purchased vehicles can be registered in the Inida as long as as ownership documents vehicle is sold with allow to do so. Please make yourself aware of any guidelines or requirements for this before you make a purchase."
        },
        {
          "q":
              "Why it takes so long to receive title from a dealer or from an auction?",
          "a":
              "It usually takes around five to ten days to get the title from an auction or a dealer. A seller has a thirty days rule during which he can provide the title of the car to the auction. If the car was under finance, the bank will hold the title of the car for the seller."
        },
        {
          "q": "What does a salvage title mean?",
          "a":
              "Yes, purchased vehicles can be registered in the Inida as long as as ownership documents vehicle is sold with allow to do so. Please make yourself aware of any guidelines or requirements for this before you make a purchase."
        },
      ]
    },
    {
      "topic": "How do I get started?",
      "qna": [
        {
          "q":
              "It's completely free! There is no cost to join with a Standard Membership.",
          "a":
              "Yes, purchased vehicles can be registered in the Inida as long as as ownership documents vehicle is sold with allow to do so. Please make yourself aware of any guidelines or requirements for this before you make a purchase."
        },
        {
          "q":
              "Why it takes so long to receive title from a dealer or from an auction?",
          "a":
              "It usually takes around five to ten days to get the title from an auction or a dealer. A seller has a thirty days rule during which he can provide the title of the car to the auction. If the car was under finance, the bank will hold the title of the car for the seller."
        },
        {
          "q": "What does a salvage title mean?",
          "a":
              "Yes, purchased vehicles can be registered in the Inida as long as as ownership documents vehicle is sold with allow to do so. Please make yourself aware of any guidelines or requirements for this before you make a purchase."
        },
      ]
    },
    {
      "topic": "Do you offer shipping?",
      "qna": [
        {
          "q":
              "It's completely free! There is no cost to join with a Standard Membership.",
          "a":
              "Yes, purchased vehicles can be registered in the Inida as long as as ownership documents vehicle is sold with allow to do so. Please make yourself aware of any guidelines or requirements for this before you make a purchase."
        },
        {
          "q":
              "Why it takes so long to receive title from a dealer or from an auction?",
          "a":
              "It usually takes around five to ten days to get the title from an auction or a dealer. A seller has a thirty days rule during which he can provide the title of the car to the auction. If the car was under finance, the bank will hold the title of the car for the seller."
        },
        {
          "q": "What does a salvage title mean?",
          "a":
              "Yes, purchased vehicles can be registered in the Inida as long as as ownership documents vehicle is sold with allow to do so. Please make yourself aware of any guidelines or requirements for this before you make a purchase."
        },
      ]
    },
  ];

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
                    // controller.homeRefresh();
                    return Future.value();
                  },
                  child: MyListView(
                    scroll: true,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0 * fem, vertical: 15 * fem),
                        child: MyListView(
                          children: [
                            RoundedContainer(
                              radius: 15,
                              clip: Clip.antiAliasWithSaveLayer,
                              borderColor: ColorPallete.grey.withOpacity(0.5),
                              child: MyListView(
                                children: faq.map((e) {
                                  return MyListView(
                                    children: [
                                      RoundedContainer(
                                        radius: 15,
                                        color: ColorPallete.theme,
                                        child: ExpansionTile(
                                            backgroundColor: ColorPallete.grey
                                                .withOpacity(0.1),
                                            title: TextView(
                                              text: e["topic"],
                                              fontSize: 14,
                                              color: ColorPallete.secondary,
                                            ),
                                            children: (e["qna"] as List)
                                                .map((e) => Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  10.0 * fem),
                                                      child: RoundedContainer(
                                                        radius: 0,
                                                        child: MyListView(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          5.0 *
                                                                              fem),
                                                                  child:
                                                                      RoundedContainer(
                                                                    radius: 0,
                                                                    child:
                                                                        CircleAvatar(
                                                                      backgroundColor:
                                                                          ColorPallete
                                                                              .secondary,
                                                                      radius:
                                                                          2.5 *
                                                                              fem,
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                      10 * fem,
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      TextView(
                                                                    text:
                                                                        e["q"],
                                                                    color: ColorPallete
                                                                        .secondary,
                                                                    // weight: FontWeight.bold,
                                                                    fontSize:
                                                                        14,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                      10.0 *
                                                                          fem),
                                                              child: TextView(
                                                                text: e["a"],
                                                                color: ColorPallete
                                                                    .secondary,
                                                                weight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10 * fem,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ))
                                                .toList()),
                                      ),
                                      if (e["topic"] !=
                                          "Do you offer shipping?")
                                        Divider(
                                          thickness: 1 * fem,
                                          height: 1 * fem,
                                          color: ColorPallete.grey
                                              .withOpacity(0.5),
                                        )
                                    ],
                                  );
                                }).toList(),
                              ),
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
    );
  }
}
