import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';



class CustomTextField extends StatelessWidget {
  const CustomTextField({

    Key? key,
    required this.controller,
    required this.focusNode,
    this.height = 44,
    this.hintText,
    this.keyboardType, this.preficicon,
  }) : super(key: key);
  final TextEditingController controller;
  final double height;
  final  hintText;
  final  keyboardType;
  final preficicon;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
       focusNode: focusNode,
        keyboardType: keyboardType,
        controller: controller,
        cursorColor: AppColors.mainColor,
        decoration:  InputDecoration(
          
          prefixIcon: Icon(
            preficicon, color: AppColors.mainColor7,
            ),
          contentPadding: const EdgeInsets.all(12),
          filled: true,
          fillColor: AppColors.background,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              gapPadding: 0,
              borderSide: BorderSide.none
              ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: AppColors.mainColor),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.black,
          )
        ),
      ),
    );
  }
}
