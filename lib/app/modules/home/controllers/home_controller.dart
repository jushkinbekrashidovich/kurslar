import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  late TextEditingController searchController;
  late final FocusNode focusNode;
  

  final count = 0.obs;
  @override
  void onInit() {
    searchController = TextEditingController();
    focusNode = FocusNode();
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
