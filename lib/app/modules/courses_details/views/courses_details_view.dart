import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/courses_details_controller.dart';

class CoursesDetailsView extends GetView<CoursesDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CoursesDetailsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CoursesDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
