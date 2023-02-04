import 'package:get/get.dart';
import 'package:kurslar/app/modules/home/controllers/home_controller.dart';
import 'package:kurslar/app/modules/news/controllers/news_controller.dart';
import 'package:kurslar/app/modules/saved/controllers/saved_controller.dart';
import 'package:kurslar/app/modules/settings/controllers/settings_controller.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<SavedController>(
      () => SavedController(),
    );
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
    Get.lazyPut<NewsController>(
      () => NewsController(),
    );
  }
}
