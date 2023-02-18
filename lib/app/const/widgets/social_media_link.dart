import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kurslar/app/const/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../custom_widgets/custom_snackbars.dart';

class SocialMediaLink extends StatelessWidget {
  const SocialMediaLink(
      {super.key,
      required this.instagramLink,
      required this.facebookLink,
      required this.telegramLink,
      required this.websiteLink});

  final String? instagramLink;
  final String? facebookLink;
  final String? telegramLink;
  final String? websiteLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () async {
                  try {
                    await launchUrl(Uri.parse(telegramLink.toString()));
                  } catch (e) {
                    showErrorSnackbar("Ushbu o'quv markaz Telegram sahifasi topilmadi");
                  }
                },
                child: SizedBox(
                  width: 120,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(10)),
                        child: SvgPicture.asset(
                          "assets/telegram.svg",
                          height: 37,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Telegram"),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  try {
                    await launchUrl(Uri.parse(websiteLink.toString()));
                  } catch (e) {
                    showErrorSnackbar("Ushbu o'quv markaz Website sahifasi topilmadi");
                  }
                },
                child: SizedBox(
                  width: 120,
                  child: Row(
                    children: [
                      Container(
                        padding:const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          CupertinoIcons.globe,
                          size: 37,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Website"),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () async {
                  try {
                    await launchUrl(Uri.parse(facebookLink.toString()));
                  } catch (e) {
                    showErrorSnackbar("Ushbu o'quv markaz Facebook sahifasi topilmadi");
                  }
                },
                child: SizedBox(
                  width: 120,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(10)),
                        child: SvgPicture.asset(
                          "assets/facebook.svg",
                          height: 37,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Facebook"),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  try {
                    await launchUrl(Uri.parse(instagramLink.toString()));
                  } catch (e) {
                    showErrorSnackbar("Ushbu o'quv markaz Instagram sahifasi topilmadi");
                  }
                },
                child: SizedBox(
                  width: 120,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(10)),
                        child: SvgPicture.asset(
                          "assets/instagram.svg",
                          height: 37,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Instagram"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
