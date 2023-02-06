import 'package:get/get.dart';

import '../controllers/courses_details_controller.dart';

class CoursesDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoursesDetailsController>(
      () => CoursesDetailsController(),
    );
  }
}
