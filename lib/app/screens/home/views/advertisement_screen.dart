import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/ads_model.dart';
import '../../../providers/api_endpoints.dart';

class AdvertisementScreen extends StatelessWidget {
  const AdvertisementScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    Sliders ad = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorPallete.theme),
        backgroundColor: ColorPallete.primary,
        title: const TextView(
          text: "Advertising",
          color: ColorPallete.theme,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
      ),
      backgroundColor: ColorPallete.theme,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: MyListView(
                scroll: true,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0 * fem),
                    child: MyListView(
                      children: [
                        RoundedContainer(
                          radius: 15,
                          height: 150,
                          width: double.infinity,
                          clip: Clip.antiAliasWithSaveLayer,
                          child: CachedNetworkImage(
                            imageUrl: Urls.getImageUrl(ad.image),
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 20 * fem,
                        ),
                        RoundedContainer(
                          radius: 0,
                          child: TextView(
                            text: ad.name.toString(),
                            color: ColorPallete.secondary,
                            fontSize: 18,
                            weight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10 * fem,
                        ),
                        RoundedContainer(
                          radius: 0,
                          child: TextView(
                            text: ad.description.toString(),
                            fontSize: 14,
                            color: ColorPallete.secondary,
                            alignment: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
            // InkWell(
            //   onTap: () {
            //     Get.back();
            //   },
            //   child: RoundedContainer(
            //     radius: 10,
            //     color: ColorPallete.primary,
            //     child: Padding(
            //       padding: EdgeInsets.symmetric(vertical: 15.0 * fem),
            //       child: const Center(
            //           child: TextView(
            //         text: "Visit Advertiser's",
            //         color: ColorPallete.theme,
            //         fontSize: 16,
            //       )),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
