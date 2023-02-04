import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kurslar/app/const/custom_widgets/custom_text_field.dart';

import '../../../const/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              title: CustomTextField(
                controller: controller.searchController,
                focusNode: controller.focusNode,
                preficicon: CupertinoIcons.search,
                hintText: "o'quv markaz nomi, fanlar",
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.FILTER_COURSES);
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
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: 280,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  height: 50,
                                  width: 40,
                                  child: Image.asset("assets/youtube.png")),
                              //SizedBox(width: 2,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 126,
                                    child: Text(
                                      "O'quv markaz nomi" * 10,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 2,
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
                          SizedBox(
                            height: 20,
                          ),
                          Wrap(
                            children: [
                              Container(
                                height: 28,
                                width: 50,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColors.mainColor7),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Center(
                                  child: Text(
                                    "English",
                                    style: TextStyle(
                                        color: AppColors.mainColor7,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Container(
                                height: 28,
                                width: 50,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColors.mainColor7),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Center(
                                  child: Text(
                                    "English",
                                    style: TextStyle(
                                        color: AppColors.mainColor7,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 180,
                            child: Text(
                              "Address" * 10,
                              style: TextStyle(
                                  color: AppColors.greyColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
        ));
  }
}
