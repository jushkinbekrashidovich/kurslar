import 'package:get/get.dart';

import '../data/models/courses_details_argument.dart';
import '../modules/about_app/bindings/about_app_binding.dart';
import '../modules/about_app/views/about_app_view.dart';
import '../modules/admin/admin_home/bindings/admin_home_binding.dart';
import '../modules/admin/admin_home/views/admin_home_view.dart';
import '../modules/admin/admin_login/bindings/admin_login_binding.dart';
import '../modules/admin/admin_login/views/admin_login_view.dart';
import '../modules/contact_info/bindings/contact_info_binding.dart';
import '../modules/contact_info/views/contact_info_view.dart';
import '../modules/courses_details/bindings/courses_details_binding.dart';
import '../modules/courses_details/views/courses_details_view.dart';
import '../modules/faq/bindings/faq_binding.dart';
import '../modules/faq/views/faq_view.dart';
import '../modules/filter_courses/bindings/filter_courses_binding.dart';
import '../modules/filter_courses/views/filter_courses_view.dart';
import '../modules/filter_news/bindings/filter_news_binding.dart';
import '../modules/filter_news/views/filter_news_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/map_screen/bindings/map_screen_binding.dart';
import '../modules/map_screen/views/map_screen_view.dart';
import '../modules/news/bindings/news_binding.dart';
import '../modules/news/views/news_view.dart';
import '../modules/news_details/bindings/news_details_binding.dart';
import '../modules/news_details/views/news_details_view.dart';
import '../modules/rate_app/bindings/rate_app_binding.dart';
import '../modules/rate_app/views/rate_app_view.dart';
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
      name: _Paths.COURSES_DETAILS,
      page: () => CoursesDetailsView(),
      binding: CoursesDetailsBinding(),
    ),
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
      name: _Paths.NEWS_DETAILS,
      page: () => NewsDetailsView(),
      binding: NewsDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_APP,
      page: () => AboutAppView(),
      binding: AboutAppBinding(),
    ),
    GetPage(
      name: _Paths.RATE_APP,
      page: () => RateAppView(),
      binding: RateAppBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_INFO,
      page: () => ContactInfoView(),
      binding: ContactInfoBinding(),
    ),
    GetPage(
      name: _Paths.MAP_SCREEN,
      page: () => MapScreenView(),
      binding: MapScreenBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_LOGIN,
      page: () => AdminLoginView(),
      binding: AdminLoginBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_HOME,
      page: () => AdminHomeView(),
      binding: AdminHomeBinding(),
    ),
    GetPage(
      name: _Paths.FAQ,
      page: () => FaqView(),
      binding: FaqBinding(),
    ),
  ];
}
