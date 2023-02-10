import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:kurslar/app/const/app_colors.dart';

import '../controllers/about_app_controller.dart';

class AboutAppView extends GetView<AboutAppController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Ilova haqida'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          SvgPicture.asset(
            "assets/logo.svg",
            height: 190,
          ),
          SizedBox(
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
            child: Text("About the app"*10000),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 42),
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: AppColors.background),
            child: Text("Version 1.1.1", style: TextStyle(fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}
