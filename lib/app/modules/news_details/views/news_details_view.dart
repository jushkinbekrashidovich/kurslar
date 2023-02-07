import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kurslar/app/const/app_colors.dart';
import 'package:kurslar/app/data/models/news_details_argument.dart';

import '../controllers/news_details_controller.dart';

class NewsDetailsView extends GetView<NewsDetailsController> {
  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments as NewsDetailsArgument;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Foydali maqolalar'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Text(
              arguments.publishedAt.toString(),
              style: const TextStyle(
                  color: AppColors.greyColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(arguments.title.toString(),
                style: GoogleFonts.poppins(
                    fontSize: 22, fontWeight: FontWeight.w700)),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 210,
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
                imageUrl: arguments.imageUrl.toString(),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(
                        color: AppColors.mainColor7,
                        value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Text(
              arguments.description.toString(),
              style: GoogleFonts.openSans(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
               const Text("Manba:", ),
               const SizedBox(width: 5,),
                Text(
                  arguments.credits.toString(),
                  style: const TextStyle(
                      color: AppColors.black, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
