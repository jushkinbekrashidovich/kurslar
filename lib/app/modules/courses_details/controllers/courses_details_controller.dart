import 'package:get/get.dart';

class CoursesDetailsController extends GetxController {
  //TODO: Implement CoursesDetailsController

  final count = 0.obs;
  RxBool expand = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
