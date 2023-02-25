import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kurslar/app/const/app_theme.dart';
import 'package:kurslar/app/data/models/courses_model.dart';
import 'package:kurslar/app/modules/splash/bindings/splash_binding.dart';

import 'app/modules/main/bindings/main_binding.dart';
import 'app/routes/app_pages.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();

  // RequestConfiguration requestConfiguration = RequestConfiguration(
  //   testDeviceIds: 

  // );

  await Hive.initFlutter();
   Hive.registerAdapter<CoursesModel>(CoursesModelAdapter());
  await Hive.openBox<CoursesModel>('favorites');
 
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
