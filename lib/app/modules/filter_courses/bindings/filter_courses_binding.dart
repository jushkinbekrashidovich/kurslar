import 'package:get/get.dart';

import '../controllers/filter_courses_controller.dart';

class FilterCoursesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FilterCoursesController>(
      () => FilterCoursesController(),
    );
  }
}
