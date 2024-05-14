import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube/youtube_thumbnail.dart';

import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../components/ui/youtube_screen.dart';
import '../../../routes/app_routes.dart';
import '../controllers/home_controller.dart';
// import '../../../../../../../common/transalations/translation_keys.dart'
//     as translations;

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
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
          body: Obx(
            () => Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () {
                      controller.homeRefresh();
                      return Future.value();
                    },
                    child: MyListView(
                      scroll: true,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
                          child: MyListView(
                            children: [
                              SizedBox(
                                height: 10 * fem,
                              ),
                              _getSliders(controller, fem),
                              SizedBox(
                                height: 20 * fem,
                              ),
                              _aboutSocialCardify(),
                              SizedBox(
                                height: 20 * fem,
                              ),
                              _howToUseApp(context, fem),
                              SizedBox(
                                height: 20 * fem,
                              ),
                              _buildBlogs(controller, fem, context),
                              SizedBox(
                                height: 15 * fem,
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

  _getSliders(HomeController controller, double fem) {
    return MyListView(
      children: [
        controller.sliders.isEmpty
            ? Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.5),
                highlightColor: Colors.white,
                child: const RoundedContainer(
                  radius: 10,
                  height: 175,
                  color: ColorPallete.grey,
                ),
              )
            : RoundedContainer(
                radius: 0,
                height: 175,
                child: PageView.builder(
                  controller: controller.sliderPageController,
                  onPageChanged: (value) {
                    controller.selectedAd.value =
                        (value % controller.sliders.length);
                    controller.selectedAd.refresh();
                    // Future.delayed(const Duration(seconds: 2), () {
                    //   controller.sliderPageController.animateToPage(value + 1,
                    //       duration: const Duration(seconds: 1),
                    //       curve: Curves.easeIn);
                    // });
                  },
                  itemBuilder: (context, index) {
                    int pos = index % controller.sliders.length;
                    var e = controller.sliders.elementAt(pos);
                    return InkWell(
                      onTap: () {
                        Get.toNamed(Routes.ADVERTISEMENT, arguments: e);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: RoundedContainer(
                          radius: 10,
                          clip: Clip.antiAliasWithSaveLayer,
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  spreadRadius: 0.5 * fem,
                                  blurRadius: 5 * fem,
                                  offset: Offset(0, 0 * fem),
                                  color: ColorPallete.grey.withOpacity(0.1))
                            ]),
                            child: Image.network(
                              e.image!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
        SizedBox(
          height: 5 * fem,
        ),
        controller.selectedAd.value == -1
            ? Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.5),
                highlightColor: Colors.white,
                child: RoundedContainer(
                  radius: 0,
                  height: 7.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [1, 2, 3].map((element) {
                      bool isSelected = element == 1;
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.5 * fem),
                        child: RoundedContainer(
                          color: isSelected
                              ? ColorPallete.grey
                              : ColorPallete.grey.withOpacity(0.5),
                          radius: 5,
                          height: 10,
                          width: isSelected ? 20 : 10,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )
            : RoundedContainer(
                radius: 0,
                height: 7.5,
                child: Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.sliders.length,
                    itemBuilder: (context, index) {
                      bool isSelected = (index) == controller.selectedAd.value;
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.5 * fem),
                        child: RoundedContainer(
                          color: isSelected
                              ? ColorPallete.primary
                              : ColorPallete.grey.withOpacity(0.5),
                          radius: 5,
                          height: 10,
                          width: isSelected ? 20 : 10,
                        ),
                      );
                    },
                  ),
                ),
              ),
      ],
    );
  }

  _aboutSocialCardify() {
    return const Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: MyListView(
        children: [
          TextView(
            text: "Social Cardify Websites",
            weight: FontWeight.bold,
            fontSize: 16,
            color: ColorPallete.secondary,
          ),
          SizedBox(
            height: 5,
          ),
          TextView(
            text:
                "We provide a beautiful website builder in min Price and Flexible Web Development",
            fontSize: 16,
            color: ColorPallete.secondary,
          ),
        ],
      ),
    );
  }

  _howToUseApp(BuildContext context, double fem) {
    return MyListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextView(
              text: "How to use the App ?",
              fontSize: 16,
              weight: FontWeight.bold,
              color: ColorPallete.secondary,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.VIDEOS);
              },
              child: const TextView(
                text: "See More",
                fontSize: 14,
                color: ColorPallete.primary,
                weight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            controller.videos.isEmpty
                ? Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.5),
                    highlightColor: Colors.white,
                    child: const RoundedContainer(
                      radius: 10,
                      height: 175,
                      color: ColorPallete.grey,
                    ),
                  )
                : RoundedContainer(
                    radius: 0,
                    height: 175,
                    child: PageView.builder(
                      controller: controller.videoPageController,
                      onPageChanged: (value) {},
                      itemBuilder: (context, index) {
                        int pos = index % controller.videos.length;
                        var e = controller.videos.elementAt(pos);
                        return InkWell(
                          onTap: () {
                            // Get.toNamed(Routes.ADVERTISEMENT,
                            //     arguments: e);
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: RoundedContainer(
                              radius: 10,
                              clip: Clip.antiAliasWithSaveLayer,
                              child: Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 0.5 * fem,
                                      blurRadius: 5 * fem,
                                      offset: Offset(0, 0 * fem),
                                      color: ColorPallete.grey.withOpacity(0.1))
                                ]),
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Image.network(
                                            YoutubeThumbnail(
                                              youtubeId: e.url!
                                                  .split("/")
                                                  .last
                                                  .split("=")
                                                  .last,
                                            ).hd(),
                                            fit: BoxFit.fill,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return const RoundedContainer(
                                                  radius: 0);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Center(
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return YoutubeScreen(
                                                  videoId: e.url!
                                                      .split("/")
                                                      .last
                                                      .split("=")
                                                      .last,
                                                );
                                              },
                                            ),
                                          );
                                        },
                                        child: const Icon(
                                          Icons.play_circle_fill_rounded,
                                          color: ColorPallete.theme,
                                          size: 60,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
            SizedBox(
              height: 5 * fem,
            ),
          ],
        ),
        SizedBox(
          height: 20 * fem,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.CREATE_WEBSITE);
              },
              child: const RoundedContainer(
                radius: 10,
                color: ColorPallete.primary,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: TextView(
                      text: "Create Website",
                      color: ColorPallete.theme,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildBlogs(HomeController controller, double fem, BuildContext context) {
    return MyListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextView(
              text: "Why Social Cardify ?",
              fontSize: 16,
              color: ColorPallete.secondary,
              weight: FontWeight.bold,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.BLOG);
              },
              child: const TextView(
                text: "See More",
                fontSize: 14,
                color: ColorPallete.primary,
                weight: FontWeight.w600,
              ),
            ),
          ],
        ),
        controller.blogs.isEmpty
            ? Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.5),
                highlightColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10 * fem),
                  child: RoundedContainer(
                    height: 150,
                    // color: ColorPallete.grey,
                    radius: 0,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 7.5 * fem,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: MyListView(
                                  isRow: true,
                                  scroll: true,
                                  children: [1, 2, 3]
                                      .map(
                                        (blog) => Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3 * fem),
                                          child: RoundedContainer(
                                            radius: 10,
                                            clip: Clip.antiAlias,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            color: ColorPallete.grey,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(vertical: 10 * fem),
                child: RoundedContainer(
                  height: 120,
                  // color: ColorPallete.grey,
                  radius: 0,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: MyListView(
                                isRow: true,
                                scroll: true,
                                children: controller.blogs
                                    .map(
                                      (blog) => Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3 * fem),
                                        child: InkWell(
                                          onTap: () {
                                            Get.toNamed(
                                              Routes.BLOG_DETAILS,
                                              arguments: {"blog": blog},
                                            );
                                          },
                                          child: RoundedContainer(
                                            radius: 10,
                                            clip: Clip.antiAlias,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5,
                                            color: ColorPallete.primary
                                                .withOpacity(0.5),
                                            child: Stack(
                                              children: [
                                                Image.network(
                                                  blog.image ?? "",
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.fill,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return RoundedContainer(
                                                      radius: 0,
                                                      color: ColorPallete
                                                          .primary
                                                          .withOpacity(0.75),
                                                    );
                                                  },
                                                ),
                                                Positioned(
                                                  left: 0,
                                                  bottom: 0,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              blurRadius: 15,
                                                              spreadRadius: 5,
                                                              color: ColorPallete
                                                                  .themeContrast
                                                                  .withOpacity(
                                                                      0.6))
                                                        ]),
                                                    child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 10,
                                                                vertical: 15.0),
                                                        child: TextView(
                                                          text: blog.title!,
                                                          fontSize: 12,
                                                          color: ColorPallete
                                                              .theme,
                                                          maxlines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: InkWell(
              onTap: () {
                final Uri telLaunchUri = Uri(
                  scheme: 'tel',
                  path: "+91 7230000408",
                );
                launchUrl(telLaunchUri);
              },
              child: const RoundedContainer(
                radius: 10,
                color: ColorPallete.primary,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: TextView(
                      text: "Customer Care",
                      color: ColorPallete.theme,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
