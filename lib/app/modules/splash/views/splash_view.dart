import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kurslar/app/const/app_colors.dart';
import 'package:kurslar/app/routes/app_pages.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        title: "Kurslar mobil ilovasiga xush kelibsiz 👋",
        body:
            "Kurslar mobil ilovasi orqali O'zbekiston bo'ylab barcha o'quv markazlari hamda kurslar haqida ma'lumotga ega bo'lishingiz mumkin!",
        image: SizedBox(
          //color: Colors.red,
          height: 265,
          width: Get.width,
          child: SvgPicture.asset("assets/about1.svg")),
        decoration: const PageDecoration(
          imageFlex: 2,
          bodyFlex: 1,
          footerFlex: 1,
          titleTextStyle: TextStyle(color: Colors.amber, fontSize: 20),
          bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 12.4),
        ),
      ),
      PageViewModel(
        title: "Kurslar mobil ilovasiga xush kelibsiz 👋",
        body:
            ".",
        image: SizedBox(
          //color: Colors.red,
          height: 280,
          width: Get.width,
          child: SvgPicture.asset("assets/about2.svg")),
        decoration: const PageDecoration(
          imageFlex: 2,
          bodyFlex: 1,
          titleTextStyle: TextStyle(color: Colors.orange),
          bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
        ),
      ),
      PageViewModel(
        
        title: "Title of orange text and bold page",
        body:
            "This is a description on a page with an orange title and bold, big body.",
        image: SizedBox(
          //color: Colors.red,
          height: 300,
          width: Get.width,
          child: SvgPicture.asset("assets/about3.svg")),
        decoration: const PageDecoration(
          imageFlex: 2,
          bodyFlex: 1,
          footerFit: FlexFit.tight,
          titleTextStyle: TextStyle(color: Colors.orange),
          bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: IntroductionScreen(
          pages: getPages(),
          isTopSafeArea: true,
          showSkipButton: true,
          next: const Text("Keyingisi", style: TextStyle(color: AppColors.mainColor7),),
          skip: const Text("Asosiy sahifa", style: TextStyle(color: AppColors.mainColor7),),
          done: const Text("Asosiy", style: TextStyle(color: AppColors.mainColor7),),
          onDone: () {
            Get.offAllNamed(Routes.MAIN);
            // On button pressed
          },
        ));
  }
}
