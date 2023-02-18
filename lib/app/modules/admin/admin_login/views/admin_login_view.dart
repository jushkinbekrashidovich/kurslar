import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kurslar/app/const/app_colors.dart';
import 'package:kurslar/app/const/custom_widgets/custom_admin_text_fileds.dart';
import 'package:kurslar/app/routes/app_pages.dart';

import '../controllers/admin_login_controller.dart';

class AdminLoginView extends GetView<AdminLoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomAdminTextField(hintText: "Email", controller: controller.emailController),
            SizedBox(height: 16),
            SizedBox(
              height: 48,
              child: TextField(
                controller: controller.passwordController,
                obscureText: true,
                cursorColor: AppColors.mainColor7,
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  
                  hintStyle: TextStyle(color: AppColors.grey),
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.ADMIN_HOME);
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainColor7
              ),
            ),
          ],
        ),
      ),
    );
  }
}
