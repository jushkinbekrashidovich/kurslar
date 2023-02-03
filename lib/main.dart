import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kurslar/app/const/app_theme.dart';
import 'package:kurslar/app/modules/splash/bindings/splash_binding.dart';

import 'app/modules/main/bindings/main_binding.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kurslar",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: SplashBinding(),
      theme: AppThemes.light,
    ),
  );
}
