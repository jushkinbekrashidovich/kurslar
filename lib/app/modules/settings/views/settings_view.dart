import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kurslar/app/const/app_colors.dart';
import 'package:kurslar/app/const/custom_widgets/custom_list_tile_widget.dart';
import 'package:kurslar/app/const/custom_widgets/custom_snackbars.dart';
import 'package:kurslar/app/routes/app_pages.dart';
import 'package:share_plus/share_plus.dart';

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
                title: const Text(
                  "O'quv markaz vakilimisiz?",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
                trailing: const Icon(CupertinoIcons.forward),
                subtitle: const Text(
                  "Biz bilan bog'laning!",
                  style: TextStyle(color: AppColors.black),
                ),
                leading: RawMaterialButton(
                  constraints: const BoxConstraints(maxHeight: 40, maxWidth: 40),
                  onPressed: () {
                    Get.toNamed(Routes.CONTACT_INFO);
                  },
                  elevation: 0.0,
                  fillColor: AppColors.background,
                  child:  Icon(
                    CupertinoIcons.person,
                    size: 20,
                  ),
                  padding: EdgeInsets.all(8.0),
                  shape: CircleBorder(),
                ),
              ),
            ),
           const SizedBox(
              height: 20,
            ),
            Text(
              "Account ma'lumotlari",
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w600, fontSize: 15),
            ),
           const SizedBox(
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
           const SizedBox(
              height: 30,
            ),
            Text(
              "Ilova",
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w600, fontSize: 15),
            ),
           const SizedBox(
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
                      title: "Tez so'raladigan savollar",
                      leading: CupertinoIcons.star,
                      function: () {}),
                  CustomListTile(
                      title: "Rate the app",
                      leading: CupertinoIcons.star,
                      function: () {}),
                  CustomListTile(
                      title: "Share the app",
                      leading: CupertinoIcons.share,
                      function: () async {
                        try {
                          await Share.share(
                              'check out my website https://example.com',
                              subject: 'Look what I made!');
                        } catch (e) {
                          print(e.toString());
                          showErrorSnackbar(e.toString());
                        }
                      }),
                  CustomListTile(
                      title: "App info",
                      leading: CupertinoIcons.info,
                      function: () {
                        Get.toNamed(Routes.ABOUT_APP);
                      }),
                      
                ],
              ),
            ),
           const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
