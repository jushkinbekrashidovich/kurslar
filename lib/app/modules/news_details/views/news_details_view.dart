import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kurslar/app/const/app_colors.dart';

import '../controllers/news_details_controller.dart';

class NewsDetailsView extends GetView<NewsDetailsController> {
  @override
  Widget build(BuildContext context) {
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
              "12/20/2023",
              style: TextStyle(
                  color: AppColors.greyColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text("How to learn flutter in a day from scratch  ",
                style: GoogleFonts.poppins(
                    fontSize: 22, fontWeight: FontWeight.w700)),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                    image: AssetImage("assets/eg.jpg"), fit: BoxFit.fill),
              ),
            ),
            Text("naa  akjja khdka kanda kna nka kiaks kaka ",
                style: GoogleFonts.openSans(
                    fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
