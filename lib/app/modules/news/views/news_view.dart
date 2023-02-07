import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kurslar/app/const/app_colors.dart';
import 'package:kurslar/app/data/models/news_details_argument.dart';

import '../../../routes/app_pages.dart';
import '../controllers/news_controller.dart';

class NewsView extends GetView<NewsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yangilik va maqolalar'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.FILTER_NEWS);
            },
            icon: const Icon(
              CupertinoIcons.slider_horizontal_3,
              weight: 10,
              color: AppColors.mainColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Visibility(
                visible: controller.isLoading.value,
                child: Container(
                  padding: EdgeInsets.all(50),
                  //width: 85.w,
                  child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12 * 1.0),
                      ),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircularProgressIndicator(
                              color: AppColors.mainColor,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Loading",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )),
                )),
            
            ...controller.newsList.map((element) {
              String viewsCount = controller.formatViewsCount(element.views!.toInt());

              return InkWell(
                onTap: () {
                  controller.incrementViews(element.postId.toString());
                  Get.toNamed(
                    Routes.NEWS_DETAILS,
                    arguments: NewsDetailsArgument(
                      title: element.title,
                      description: element.description,
                      imageUrl: element.imageUrl,
                      publishedAt: element.publishedAt,
                      credits: element.credits,
                      views: element.views.toString(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 120,
                  //margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                          width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.grey,
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          
                          height: 100,
                          width: 100,
                          imageUrl: element.imageUrl.toString(),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      color: AppColors.mainColor7,
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              element.title.toString(),
                              maxLines: 4,
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.time,
                                      color: AppColors.grey,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      element.publishedAt.toString(),
                                      style: GoogleFonts.poppins(
                                          fontSize: 12, color: AppColors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.eye,
                                      color: AppColors.grey,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                   
                                    Text(
                                     viewsCount.toString(),
                                      style: GoogleFonts.poppins(
                                          fontSize: 12, color: AppColors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
