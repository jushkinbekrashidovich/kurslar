import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kurslar/app/const/app_colors.dart';
import 'package:kurslar/app/routes/app_pages.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../controllers/about_app_controller.dart';

class AboutAppView extends GetView<AboutAppController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Ilova haqida'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.ADMIN_LOGIN);
            },
            icon: const Icon(
              Icons.admin_panel_settings,
              size: 29,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          SvgPicture.asset(
            "assets/logo.svg",
            height: 190,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 200,
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.background),
            child: Text(
              "Kurslar ilovasi bu O'zbekiston bo'ylab barcha o'quv markaz hamda kurslar haqida ma'lumotlarni o'z ichiga jamlagan mobil ilova. Ilova orqali o'zingizga maqul bo'lgan o'quv kurslari haqida ma'lumot olishingiz, ularni qidirishingiz va sizga eng yaqin joylashgan o'quv kurslarini topishingiz mumkin.",
              style: GoogleFonts.lora(fontSize: 14),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: PackageInfo.fromPlatform(),
            builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
              if (snapshot.hasData) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 42),
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: AppColors.background),
                  child: Text(snapshot.data!.version),
                );
              }
              if (snapshot.hasError){
                print("error is "+snapshot.error.toString());
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
