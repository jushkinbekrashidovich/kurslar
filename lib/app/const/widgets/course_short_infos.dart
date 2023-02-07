import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app_colors.dart';
import '../custom_widgets/custom_icon_button.dart';
import '../custom_widgets/custom_sub_title.dart';

class CourseShortInfos extends StatelessWidget {
  const CourseShortInfos({super.key, required this.image_url,  required this.school_name, required this.address,required this.latitude_location, required this.longtitude_location, required this.phone_number});
  final String? image_url;
  final String? school_name;
  final String? address;
  final String? latitude_location;
  final String? longtitude_location;
  final String? phone_number;



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        CachedNetworkImage(
          height: 70,
          width: 60,
          imageUrl: image_url.toString(),
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(
                  color: AppColors.mainColor7,
                  value: downloadProgress.progress),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 200,
          child: Text(
            school_name.toString(),
            style: GoogleFonts.poppins(
              fontSize: 23,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.2,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        CustomSubtitle(
          subtitle: address.toString(),
        ),

        Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    function: () async {
                      await MapLauncher.showMarker(
                        mapType: MapType.google,
                        title: school_name.toString(),
                        coords: Coords(double.parse(latitude_location.toString()), double.parse(longtitude_location.toString())),
                      );
                    },
                    icon:  Icon(CupertinoIcons.location_solid,
                        size: 19, color: AppColors.mainColor),
                    title: "Manzil",
                  ),
                 const SizedBox(
                    width: 12,
                  ),
                  CustomIconButton(
                    function: () async{
                      
                      //return print("heie");
                      //print(argument.phone_number.toString());
                      launch("tel://${phone_number}");
                    },
                    icon: Icon(CupertinoIcons.phone_fill_arrow_up_right,
                        size: 19, color: AppColors.mainColor),
                    title: "Telefon",
                  ),
                ],
              ),
            ),
      ],
    );
  }
}
