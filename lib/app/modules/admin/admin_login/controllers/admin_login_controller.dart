import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminLoginController extends GetxController {
  //TODO: Implement AdminLoginController
  
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final email = "helloworld";
  final password = "21122112";
  
  final count = 0.obs;
  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
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
