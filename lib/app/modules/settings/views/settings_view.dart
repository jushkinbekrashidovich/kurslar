import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kurslar/app/const/app_colors.dart';
import 'package:kurslar/app/const/custom_widgets/custom_list_tile_widget.dart';

import '../controllers/settings_controller.dart';
import 'package:dotted_line/dotted_line.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SettingsView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  
                  colors: [
                    Colors.blue,
                    Colors.pink.shade300,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ListTile(
                title: Text(
                  "O'quv markaz vakilimisiz?",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
                trailing: Icon(CupertinoIcons.forward),
                subtitle: Text("Biz bilan bog'laning!", style: TextStyle(color: AppColors.black),),
                leading: RawMaterialButton(
                  constraints: BoxConstraints(maxHeight: 40, maxWidth: 40),
                  onPressed: () {},
                  elevation: 0.0,
                  fillColor: AppColors.background,
                  child: Icon(
                    CupertinoIcons.person,
                    size: 20,
                  ),
                  padding: EdgeInsets.all(8.0),
                  shape: CircleBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Account ma'lumotlari",
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w600, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white),
              child: Column(
                children: [
                  CustomListTile(
                      title: "Murojaat",
                      leading: CupertinoIcons.phone,
                      function: () {}),
                  CustomListTile(
                      title: "Murojaat",
                      leading: CupertinoIcons.phone,
                      function: () {}),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Ilova",
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w600, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white),
              child: Column(
                children: [
                  CustomListTile(
                      title: "Ilova haqida",
                      leading: CupertinoIcons.star,
                      function: () {}),
                  CustomListTile(
                      title: "Tez so'raladigan savollar",
                      leading: CupertinoIcons.star,
                      function: () {}),
                  CustomListTile(
                      title: "Rate the app",
                      leading: CupertinoIcons.star,
                      function: () {}),
                  CustomListTile(
                      title: "Rate the app",
                      leading: CupertinoIcons.star,
                      function: () {}),
                  CustomListTile(
                      title: "Share the app",
                      leading: CupertinoIcons.share,
                      function: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
