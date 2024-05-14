import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube/youtube_thumbnail.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../components/ui/youtube_screen.dart';
import '../../home/controllers/home_controller.dart';

// ignore: must_be_immutable
class VideosScreen extends GetView<HomeController> {
  const VideosScreen({Key? key}) : super(key: key);

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
          appBar: AppBar(
            backgroundColor: ColorPallete.primary,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back,
                color: ColorPallete.theme,
              ),
            ),
            title: const TextView(
              text: "How to use the App ?",
              color: ColorPallete.theme,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
          ),
          body: RoundedContainer(
            radius: 0,
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () {
                      controller.fetchBlogs();
                      return Future.value();
                    },
                    child: MyListView(
                      scroll: true,
                      children: [
                        Obx(
                          () => Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0 * fem, vertical: 10 * fem),
                            child: controller.videos.isEmpty
                                ? SizedBox(
                                    height: 200 * fem,
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        color: ColorPallete.primary,
                                      ),
                                    ),
                                  )
                                : GridView.count(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10 * fem,
                                    mainAxisSpacing: 10 * fem,
                                    // childAspectRatio: 1.5,
                                    shrinkWrap: true,
                                    children: controller.videos.map((video) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10 * fem),
                                        child: RoundedContainer(
                                          radius: 10,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              3,
                                          clip: Clip.antiAliasWithSaveLayer,
                                          color: ColorPallete.secondary
                                              .withOpacity(0.1),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: Stack(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              RoundedContainer(
                                                            radius: 10,
                                                            clip: Clip
                                                                .antiAliasWithSaveLayer,
                                                            child:
                                                                Image.network(
                                                              YoutubeThumbnail(
                                                                youtubeId: video
                                                                    .url!
                                                                    .split("/")
                                                                    .last
                                                                    .split("=")
                                                                    .last,
                                                              ).hd(),
                                                              fit: BoxFit.fill,
                                                              errorBuilder:
                                                                  (context,
                                                                      error,
                                                                      stackTrace) {
                                                                return const RoundedContainer(
                                                                    radius: 0);
                                                              },
                                                            ),
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
                                                              builder:
                                                                  (context) {
                                                                return YoutubeScreen(
                                                                  videoId: video
                                                                      .url!
                                                                      .split(
                                                                          "/")
                                                                      .last
                                                                      .split(
                                                                          "=")
                                                                      .last,
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                        child: const Icon(
                                                          Icons
                                                              .play_circle_fill_rounded,
                                                          color: ColorPallete
                                                              .theme,
                                                          size: 60,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10 * fem,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10 * fem,
                                                    horizontal: 10 * fem),
                                                child: MyListView(
                                                  children: [
                                                    TextView(
                                                      text:
                                                          "Title : ${video.title!}",
                                                      weight: FontWeight.bold,
                                                      fontSize: 14,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxlines: 2,
                                                      color: ColorPallete
                                                          .secondary,
                                                    ),
                                                    // SizedBox(
                                                    //   height: 5 * fem,
                                                    // ),
                                                    // TextView(
                                                    //   text: blog.description ??
                                                    //       "",
                                                    //   maxlines: 2,
                                                    //   weight: FontWeight.bold,
                                                    //   overflow:
                                                    //       TextOverflow.ellipsis,
                                                    //   color: ColorPallete
                                                    //       .secondary,
                                                    // ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList(),
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
      ),
    );
  }
}
