
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kurslar/app/modules/courses_details/controllers/courses_details_controller.dart';

import '../../../const/app_colors.dart';
import '../../../const/custom_widgets/custom_icon_button.dart';
import '../../../const/custom_widgets/custom_sub_title.dart';

import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class CoursesDetailsView extends GetView<CoursesDetailsController> {
  const CoursesDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      (){
      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          shadowColor: AppColors.background,
          elevation: 0.3,
          scrolledUnderElevation: 0.3,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.share,
                  size: 26,
                )),
           const SizedBox(
              width: 2,
            ),
          ],
        ),
        body: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  Image.asset(
                    'assets/youtube.png',
                    height: 90,
                  ),
                  Container(
                    width: 200,
                    child: Text(
                      'Cambridge Learning Centre',
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  CustomSubtitle(
                    subtitle: "Qarshi sh. Qashqadaryo vil",
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(function: ()async{
                   await MapLauncher.showMarker(
                      mapType: MapType.google,
                      title: "ArzonTalim",
                      coords: Coords(41.338557200966854, 69.33445489587548),
                      
                      
                    );

                  }, icon: Icon(CupertinoIcons.location_solid, color: AppColors.mainColor),
                  title: "Manzil",
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  CustomIconButton(
                    function:(){
                      
                      return print("heie");

                    } 

                    //launch("tel//+99899884766432");

                  , icon: Icon(CupertinoIcons.phone_fill_arrow_up_right, color: AppColors.mainColor),
                  title: "Telefon",
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 33, right: 10, left: 10),
              child: DottedLine(
                dashColor: Color.fromARGB(255, 189, 204, 216),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Umumiy",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 19),
                  ),
                 const SizedBox(
                    height: 20,
                  ),
                  CustomTitle(
                    title: "O'quv markaz to'liq nomi",
                   subtitle: "Amazon",
                  ),
                 const SizedBox(
                    height: 20,
                  ),
                  CustomTitle(title: "Na", subtitle:"Yes"),
                 const SizedBox(
                    height: 20,
                  ),
                  CustomTitle(title: "Manzil", subtitle:"улица Фурката 1, здание «Таштеплоэнерго», 6 эт."),
                 const SizedBox(
                    height: 20,
                  ),
                  CustomTitle(title: "hlp", subtitle: "hahah")
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only( right: 10, left: 10),
              child: DottedLine(
                dashColor: Color.fromARGB(255, 189, 204, 216),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tavsif".toUpperCase(),
                    style: TextStyle(
                        color: Color.fromARGB(255, 189, 204, 216),
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                        "Amazon kompansjsjsjjsjs sjssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssjsjsjjsjjjjjj",
                        style: GoogleFonts.poppins(
                          letterSpacing: 0.1,
                          fontWeight: FontWeight.w500,
                        ),
                       maxLines: controller.expand.value?10:3,
                        overflow: controller.expand.value? TextOverflow.visible:TextOverflow.fade ,
                        textAlign: TextAlign.start,
                      ),
    
                  InkWell(
                    onTap: () {
                      controller.expand.value = !controller.expand.value;
                    },
                    child: Row(
                      children: [
                        Text("Read more", style: GoogleFonts.poppins(
                          color: AppColors.mainColor7,
                          fontSize: 17,
                        ),
                        ),
                       const SizedBox(width: 7,),
                        controller.expand.value?const Icon(CupertinoIcons.chevron_up, size:18, color: AppColors.mainColor7,):const Icon(CupertinoIcons.chevron_down,color: AppColors.mainColor7,size: 18,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8, right: 10, left: 10),
              child: DottedLine(
                dashColor: AppColors.greyColor,
              ),
            ),
            SizedBox(height: 20,),
            
            SizedBox(height: 40,),
          ],
        ),
    );}
    );
  }
}
