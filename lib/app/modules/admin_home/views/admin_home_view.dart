import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kurslar/app/const/app_colors.dart';

import '../controllers/admin_home_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text("Hi, John"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.publish),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.update),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.send),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'AdminHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
