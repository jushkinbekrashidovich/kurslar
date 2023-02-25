import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../const/app_colors.dart';
import '../../../data/models/courses_details_argument.dart';
import '../../../data/models/courses_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/saved_controller.dart';

class SavedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved View'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
          valueListenable: Hive.box<CoursesModel>('favorites').listenable(),
          builder: (context, box, child) {
            final eduPosts = box.values.toList();
            if (eduPosts.isEmpty) {
              return const Center(
                child: Text("No saved"),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                itemCount: eduPosts.length,
                itemBuilder: (context, index) {
                  final eduEachPost = eduPosts[index];
                  final isFavorite = box.get(index) != null;
                  
                  return InkWell(
                    onTap: () {
                      Get.toNamed(
                        Routes.COURSES_DETAILS,
                        arguments: CoursesDetailsArguments(
                          address: eduEachPost.address,
                          phone_number: eduEachPost.phone_number,
                          school_name: eduEachPost.school_name,
                          description: eduEachPost.description,
                          facebook_link: eduEachPost.facebook_link,
                          website_link: eduEachPost.website_link,
                          instagram_link: eduEachPost.instagram_link,
                          telegram_link: eduEachPost.telegram_link,
                          image_url: eduEachPost.image_url,
                          latitude_location: eduEachPost.latitude_location,
                          longtitude_location: eduEachPost.longtitude_location,
                          subjects: eduEachPost.subjects,
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: 200,
                      //width: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Hero(
                                  tag:
                                      "courses${eduEachPost.address.toString()}",
                                  child: Container(
                                    height: 80,
                                    width: 70,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: AppColors.background,
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      height: 70,
                                      width: 60,
                                      imageUrl:
                                          eduEachPost.image_url.toString(),
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          CircularProgressIndicator(
                                              color: AppColors.mainColor7,
                                              value: downloadProgress.progress),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 126,
                                      child: Text(
                                        eduEachPost.school_name.toString(),
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
                                        eduEachPost.address.toString(),
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
                                    print(box.length.toString());
                                    if (isFavorite) {
                                      box.delete(index);
                                    } else {
                                      box.put(index, eduEachPost);
                                    }
                                  },
                                  icon: isFavorite
                                      ? const Icon(
                                          CupertinoIcons.bookmark_fill,
                                          color: Colors.black,
                                        )
                                      : const Icon(
                                          CupertinoIcons.bookmark,
                                          color: Colors.black,
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
                                ...(
                                  eduEachPost.subjects!.length >= 7
                                        ? eduEachPost.subjects!.take(6)
                                        : eduEachPost.subjects!)
                                    .map((subjects) {
                                  return Container(
                                    height: 28,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.mainColor7),
                                        borderRadius: BorderRadius.circular(4)),
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
                                eduEachPost.subjects!.length >= 7
                                    ? const Text(
                                        'va yana...',
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
                });
          }),
    );
  }
}
