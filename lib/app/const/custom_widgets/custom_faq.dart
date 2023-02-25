import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';

class CustomFAQ extends StatelessWidget {
  const CustomFAQ({super.key, required this.title, required this.description});
  final title;
  final description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        //backgroundColor: AppColors.white,
        iconColor: AppColors.mainColor,
        collapsedIconColor: AppColors.mainColor,
        title: Text(
          title,
          style: GoogleFonts.lora(fontSize: 18, color: AppColors.mainColor7),
        ),
        children: [
          ListTile(
            iconColor: AppColors.mainColor,
            title: Text(
              description,
              style: GoogleFonts.lora(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
