import 'package:get/get.dart';

import '../controllers/filter_news_controller.dart';

class FilterNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FilterNewsController>(
      () => FilterNewsController(),
    );
  }
}
