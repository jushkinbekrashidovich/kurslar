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
                  focusNode: controller.focusNode,
                  keyboardType: TextInputType.text,
                  controller: controller.searchController,
                  cursorColor: AppColors.mainColor,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      color: AppColors.mainColor7,
                    ),
                    contentPadding:  EdgeInsets.all(12),
                    filled: true,
                    fillColor: AppColors.background,
                    border:  OutlineInputBorder(
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
                    hintText: "hintText",
                    hintStyle: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.FILTER_COURSES);
                    controller.courses.first.toString();
                    //controller.getEduCenterPosts();
                  },
                  icon: const Icon(
                    CupertinoIcons.slider_horizontal_3,
                    weight: 10,
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
            body: Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  
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
                  ...controller.courses.value.map((element) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(
                          Routes.COURSES_DETAILS,
                          arguments: CoursesDetailsArguments(
                            address: element.address,
                            phone_number: element.phone_number,
                            school_name: element.school_name,
                            description: element.description,
                            facebook_link: element.facebook_link,
                            website_link: element.website_link,
                            instagram_link: element.instagram_link,
                            telegram_link: element.telegram_link,
                            image_url: element.image_url,
                            latitude_location: element.latitude_location,
                            longtitude_location: element.longtitude_location,
                            subjects: element.subjects,
                          ),
                        );
                      },
                      child: Container(
                        height: 200,
                        //width: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //SizedBox(width: 2,),
                                  Container(
                                    height: 80,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.white,
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      height: 70,
                                      width: 60,
                                      imageUrl: element.image_url.toString(),
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          CircularProgressIndicator(
                                              color: AppColors.mainColor7,
                                              value: downloadProgress.progress),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
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
                                          element.school_name.toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Container(
                                        width: 130,
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          element.address.toString(),
                                          style: const TextStyle(
                                              color: AppColors.greyColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      controller.is_favorite.value =
                                          !controller.is_favorite.value;
                                    },
                                    icon: controller.is_favorite.value
                                        ? const Icon(
                                            CupertinoIcons.bookmark,
                                            color: AppColors.black,
                                            size: 28,
                                          )
                                        : const Icon(
                                            CupertinoIcons.bookmark_fill,
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
                                  ...(element.subjects!.length >= 7
                                          ? element.subjects!.take(6)
                                          : element.subjects!)
                                      .map((subjects) {
                                    return Container(
                                      height: 28,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.mainColor7),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Center(
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            subjects,
                                            style: const TextStyle(
                                                color: AppColors.mainColor7,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                  element.subjects!.length >= 7
                                      ? const Text(
                                          'and more...',
                                          style: TextStyle(
                                              color: AppColors.mainColor7,
                                              fontWeight: FontWeight.w500,
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
                ],
              ),
            ),
          ),
        ));
  }
}
