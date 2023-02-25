import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kurslar/app/const/custom_widgets/custom_snackbars.dart';
import 'package:kurslar/app/const/widgets/social_media_link.dart';
import 'package:kurslar/app/modules/courses_details/controllers/courses_details_controller.dart';
import 'package:share_plus/share_plus.dart';

import '../../../const/app_colors.dart';
import '../../../const/custom_widgets/custom_icon_button.dart';
import '../../../const/custom_widgets/custom_sub_title.dart';

import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../const/widgets/course_short_infos.dart';
import '../../../data/models/courses_details_argument.dart';

class CoursesDetailsView extends GetView<CoursesDetailsController> {
  //final CoursesDetailsArguments arguments;

  CoursesDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var argument = Get.arguments as CoursesDetailsArguments;
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          shadowColor: AppColors.background,
          elevation: 0.3,
          scrolledUnderElevation: 0.3,
          actions: [
            InkWell(
              onTap: () async {
                try {
                  await Share.share(
                    "${argument.school_name},\n\n Kurslar Ilovasini yuklab oling \n\n ${argument.description} ${argument.website_link} ",
                  );
                } catch (e) {
                  print(e.toString());
                  showErrorSnackbar(e.toString());
                }
              },
              child: Container(
                height: 40,
                padding: EdgeInsets.only(bottom: 5, left: 7, right: 7, top: 2),
                margin: EdgeInsets.only(),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.background),
                child: const Icon(
                  CupertinoIcons.share,
                  size: 26,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: ListView(
          children: [
            CourseShortInfos(
              tag: "courses${argument.image_url.toString()}",
              address: argument.address,
              school_name: argument.school_name,
              phone_number: argument.phone_number,
              image_url: argument.image_url,
              latitude_location: argument.latitude_location,
              longtitude_location: argument.longtitude_location,
            ),
            Container(
              padding: const EdgeInsets.only(top: 23, right: 10, left: 10),
              child: const DottedLine(
                dashColor: Color.fromARGB(255, 189, 204, 216),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 16, left: 10, right: 10, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Umumiy",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 19),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTitle(
                    title: "O'quv markaz to'liq nomi",
                    subtitle: argument.school_name,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 5, left: 5),
                    child: const DottedLine(
                      dashColor: Color.fromARGB(255, 189, 204, 216),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Kurslar".toUpperCase(),
                    style: const TextStyle(
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: [
                      ...(argument.subjects!).map((subjects) {
                        return Container(
                          height: 28,
                          width: 80,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.mainColor7),
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
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 5, left: 5),
                    child: const DottedLine(
                      dashColor: Color.fromARGB(255, 189, 204, 216),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (_) => CupertinoAlertDialog(
                          title: SelectableText(
                            "${argument.phone_number}",
                          ),
                          content: const Text(
                              "Iltimos qo'ng'iroq qilyotganingizda ushbu markaz haqida KURSLAR ilovasi orqali topganingizni ayting!"),
                          actions: [
                            CupertinoButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      child: const CustomTitle(
                          title: "Telefon Raqami",
                          subtitle: "+9989*...-to'liq ko'rish uchun bosing"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 5, left: 5),
                    child: const DottedLine(
                      dashColor: Color.fromARGB(255, 189, 204, 216),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTitle(
                      title: "Manzil", subtitle: argument.address.toString()),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 5, left: 5),
                    child: const DottedLine(
                      dashColor: Color.fromARGB(255, 189, 204, 216),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Markaz haqida".toUpperCase(),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 189, 204, 216),
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    argument.description.toString(),
                    style: GoogleFonts.poppins(
                      letterSpacing: 0.1,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: controller.expand.value ? 100 : 3,
                    overflow: controller.expand.value
                        ? TextOverflow.visible
                        : TextOverflow.fade,
                    textAlign: TextAlign.start,
                  ),
                  InkWell(
                    onTap: () {
                      controller.expand.value = !controller.expand.value;
                    },
                    child: Row(
                      children: [
                        Text(
                          "Batafsil",
                          style: GoogleFonts.poppins(
                            color: AppColors.mainColor7,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        controller.expand.value
                            ? const Icon(
                                CupertinoIcons.chevron_up,
                                size: 18,
                                color: AppColors.mainColor7,
                              )
                            : const Icon(
                                CupertinoIcons.chevron_down,
                                color: AppColors.mainColor7,
                                size: 18,
                              )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 8, right: 10, left: 10),
              child: const DottedLine(
                dashColor: AppColors.greyColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SocialMediaLink(
              instagramLink: argument.instagram_link,
              facebookLink: argument.facebook_link,
              telegramLink: argument.telegram_link,
              websiteLink: argument.website_link,
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      );
    });
  }
}
