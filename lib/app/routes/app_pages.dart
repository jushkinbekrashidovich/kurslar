import 'package:get/get.dart';

import '../modules/courses_details/bindings/courses_details_binding.dart';
import '../modules/courses_details/views/courses_details_view.dart';
import '../modules/filter_courses/bindings/filter_courses_binding.dart';
import '../modules/filter_courses/views/filter_courses_view.dart';
import '../modules/filter_news/bindings/filter_news_binding.dart';
import '../modules/filter_news/views/filter_news_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/news/bindings/news_binding.dart';
import '../modules/news/views/news_view.dart';
import '../modules/news_details/bindings/news_details_binding.dart';
import '../modules/news_details/views/news_details_view.dart';
import '../modules/saved/bindings/saved_binding.dart';
import '../modules/saved/views/saved_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.FILTER_COURSES,
      page: () => FilterCoursesView(),
      binding: FilterCoursesBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SAVED,
      page: () => SavedView(),
      binding: SavedBinding(),
    ),
    GetPage(
      name: _Paths.NEWS,
      page: () => NewsView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.FILTER_NEWS,
      page: () => FilterNewsView(),
      binding: FilterNewsBinding(),
    ),
    GetPage(
      name: _Paths.COURSES_DETAILS,
      page: () => CoursesDetailsView(),
      binding: CoursesDetailsBinding(),
    ),
    GetPage(
      name: _Paths.NEWS_DETAILS,
      page: () => NewsDetailsView(),
      binding: NewsDetailsBinding(),
    ),
  ];
}
