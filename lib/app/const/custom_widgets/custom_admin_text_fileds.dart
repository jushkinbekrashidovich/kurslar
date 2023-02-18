import 'package:flutter/material.dart';

import '../app_colors.dart';

class CustomAdminTextField extends StatelessWidget {
  const CustomAdminTextField({super.key, required this.hintText, required this.controller});
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        cursorColor: AppColors.mainColor7,
        controller: controller,
        
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.grey),
          //labelText: 'Email',
          labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
