import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';

class CustomIconButton extends StatelessWidget {

  final Function function;
  final Icon icon;
  final title;
  

  const CustomIconButton({super.key, required this.function, required this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),      
      child: Container(
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.2,
            color: AppColors.mainColor,
          ),
          borderRadius: BorderRadius.circular(9),
        ),
        height: 45,
        width: 110,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
