import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kurslar/app/const/custom_widgets/custom_text_field.dart';
import 'package:kurslar/app/data/models/courses_details_argument.dart';
import 'package:kurslar/app/modules/courses_details/views/courses_details_view.dart';

import '../../../const/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              title: SizedBox(
                height: 44,
                child: TextField(
                  onChanged: (value) => controller.filterSearchResults(value),
                  focusNode: controller.focusNode,
                  keyboardType: TextInputType.text,
                  controller: controller.searchController,
                  cursorColor: AppColors.mainColor,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      color: AppColors.mainColor7,
                    ),
                    contentPadding: EdgeInsets.all(12),
                    filled: true,
                    fillColor: AppColors.background,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        gapPadding: 0,
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: AppColors.mainColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    hintText: "Manzil/fan nomi orqali qidiring",
                    hintStyle: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              centerTitle: true,
              // actions: [
              //   IconButton(
              //     onPressed: () {
              //       //print("printed:"+controller.filteredCourses.length.toString());
              //       Get.toNamed(Routes.FILTER_COURSES);
              //       controller.courses.first.toString();
              //       //controller.getEduCenterPosts();
              //     },
              //     icon: const Icon(
              //       CupertinoIcons.slider_horizontal_3,
              //       weight: 10,
              //       color: AppColors.mainColor,
              //     ),
              //   ),
              // ],
            ),
            body: Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.topCenter,
              child: Column(children: [
                Visibility(
                    visible: controller.isLoading.value,
                    child: Container(
                      //padding: EdgeInsets.all(50),
                      //width: 85.w,
                      child: Container(
                          padding: EdgeInsets.all(15),
                          //width: double.infinity,
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
                Expanded(
                  child: controller.filteredCourses.value.isEmpty
                      ? Center(
                          child: Text("No results"),
                        )
                      : ListView.builder(

                          //shrinkWrap: true,
                          itemCount: controller.filteredCourses.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(
                                  Routes.COURSES_DETAILS,
                                  arguments: CoursesDetailsArguments(
                                    address: controller
                                        .filteredCourses[index].address,
                                    phone_number: controller
                                        .filteredCourses[index].phone_number,
                                    school_name: controller
                                        .filteredCourses[index].school_name,
                                    description: controller
                                        .filteredCourses[index].description,
                                    facebook_link: controller
                                        .filteredCourses[index].facebook_link,
                                    website_link: controller
                                        .filteredCourses[index].website_link,
                                    instagram_link: controller
                                        .filteredCourses[index].instagram_link,
                                    telegram_link: controller
                                        .filteredCourses[index].telegram_link,
                                    image_url: controller
                                        .filteredCourses[index].image_url,
                                    latitude_location: controller
                                        .filteredCourses[index]
                                        .latitude_location,
                                    longtitude_location: controller
                                        .filteredCourses[index]
                                        .longtitude_location,
                                    subjects: controller
                                        .filteredCourses[index].subjects,
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                height: 200,
                                //width: 280,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          //SizedBox(width: 2,),
                                          Hero(
                                            transitionOnUserGestures: true,
                                            tag:
                                                "courses${controller.filteredCourses[index].image_url.toString()}",
                                            child: Container(
                                              height: 80,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                                color: Colors.white,
                                              ),
                                              clipBehavior: Clip.antiAlias,
                                              child: CachedNetworkImage(
                                                
                                                fit: BoxFit.fill,
                                                height: 70,
                                                width: 60,
                                                imageUrl: controller
                                                    .filteredCourses[index]
                                                    .image_url
                                                    .toString(),
                                                    
                                                progressIndicatorBuilder:
                                                    (context, url,
                                                            downloadProgress) =>
                                                        CircularProgressIndicator(
                                                            color: AppColors
                                                                .mainColor7,
                                                            value:
                                                                downloadProgress
                                                                    .progress),
                                                                  
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),

                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 126,
                                                child: Text(
                                                  controller
                                                      .filteredCourses[index]
                                                      .school_name
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Container(
                                                width: 130,
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  controller
                                                      .filteredCourses[index]
                                                      .address
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color:
                                                          AppColors.greyColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              controller.isFavorite.value =
                                                  !controller.isFavorite.value;
                                            },
                                            icon: controller.isFavorite.value
                                                ? const Icon(
                                                    CupertinoIcons.bookmark,
                                                    color: AppColors.black,
                                                    size: 28,
                                                  )
                                                : const Icon(
                                                    CupertinoIcons
                                                        .bookmark_fill,
                                                    size: 28,
                                                    color: AppColors.black,
                                                  ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Wrap(
                                        spacing: 4,
                                        runSpacing: 4,
                                        children: [
                                          ...(controller.filteredCourses[index]
                                                          .subjects!.length >=
                                                      7
                                                  ? controller
                                                      .filteredCourses[index]
                                                      .subjects!
                                                      .take(6)
                                                  : controller
                                                      .filteredCourses[index]
                                                      .subjects!)
                                              .map((subjects) {
                                            return Container(
                                              height: 28,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          AppColors.mainColor7),
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Center(
                                                child: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                    subjects,
                                                    style: const TextStyle(
                                                        color: AppColors
                                                            .mainColor7,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12),
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                          controller.filteredCourses[index]
                                                      .subjects!.length >=
                                                  7
                                              ? const Text(
                                                  'and more...',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.mainColor7,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12),
                                                )
                                              : Container()
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                ),
              ]),
            ),
          ),
        ));
  }
}
