import 'package:get/get.dart';

import '../controllers/rate_app_controller.dart';

class RateAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RateAppController>(
      () => RateAppController(),
    );
  }
}
