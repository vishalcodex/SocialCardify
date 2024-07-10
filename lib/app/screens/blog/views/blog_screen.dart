import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../providers/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../../home/controllers/home_controller.dart';

// ignore: must_be_immutable
class BlogScreen extends GetView<HomeController> {
  const BlogScreen({Key? key}) : super(key: key);

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
              text: "Why Social Cardify ?",
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
                            child: controller.blogs.isEmpty
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
                                    shrinkWrap: true,
                                    children: controller.blogs.map((blog) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10 * fem),
                                        child: InkWell(
                                          onTap: () {
                                            Get.toNamed(Routes.BLOG_DETAILS,
                                                arguments: {"blog": blog});
                                          },
                                          child: RoundedContainer(
                                            radius: 10,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                3,
                                            color: ColorPallete.secondary
                                                .withOpacity(0.1),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: RoundedContainer(
                                                    radius: 10,
                                                    color: ColorPallete.theme,
                                                    clip: Clip
                                                        .antiAliasWithSaveLayer,
                                                    child: Image.network(
                                                      Urls.getImageUrl(
                                                          blog.image),
                                                      // height: 75
                                                      width: double.infinity,
                                                      fit: BoxFit.fill,
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return RoundedContainer(
                                                          radius: 0,
                                                          color: ColorPallete
                                                              .primary
                                                              .withOpacity(0.5),
                                                        );
                                                      },
                                                    ),
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
                                                            "Title : ${blog.title!}",
                                                        weight: FontWeight.bold,
                                                        fontSize: 14,
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
