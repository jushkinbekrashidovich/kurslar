import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../custom_widgets/custom_snackbars.dart';

class SocialMediaLink extends StatelessWidget {
  const SocialMediaLink({super.key, required this.instagramLink, required this.facebookLink, required this.telegramLink,required this.websiteLink});

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
                    await launchUrl(
                        Uri.parse(telegramLink.toString()));
                  } catch (e) {
                    showErrorSnackbar(e.toString());
                  }
                },
                child: SizedBox(
                  width: 120,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/telegram.svg",
                        height: 39,
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
                    await launchUrl(
                        Uri.parse(websiteLink.toString()));
                  } catch (e) {
                    showErrorSnackbar(e.toString());
                  }
                },
                child: const SizedBox(
                  width: 120,
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.globe,
                        size: 38,
                        color: Colors.blue,
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
                    await launchUrl(
                        Uri.parse(facebookLink.toString()));
                  } catch (e) {
                    showErrorSnackbar(e.toString());
                  }
                },
                child: SizedBox(
                  width: 120,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/facebook.svg",
                        height: 39,
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
                    await launchUrl(
                        Uri.parse(instagramLink.toString()));
                  } catch (e) {
                    showErrorSnackbar(e.toString());
                  }
                },
                child: SizedBox(
                  width: 120,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/instagram.svg",
                        height: 39,
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
