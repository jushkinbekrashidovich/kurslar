import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rate_app_controller.dart';

class RateAppView extends GetView<RateAppController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RateAppView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RateAppView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
