import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kurslar/app/const/app_theme.dart';
import 'package:kurslar/app/data/models/courses_model.dart';
import 'package:kurslar/app/modules/splash/bindings/splash_binding.dart';

import 'app/modules/main/bindings/main_binding.dart';
import 'app/routes/app_pages.dart';


void main() async{
  
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.openBox<CoursesModel>('favorites');
  Hive.registerAdapter<CoursesModel>(CoursesModelAdapter());
  await Firebase.initializeApp();
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
