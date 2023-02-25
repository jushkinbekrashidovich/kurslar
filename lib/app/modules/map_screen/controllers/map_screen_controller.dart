import 'dart:async';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kurslar/app/data/models/courses_model.dart';
import 'package:permission_handler/permission_handler.dart';

class MapScreenController extends GetxController {
  final Geolocator geolocator = Geolocator();
  late Position currentPosition;
  late GoogleMapController googleMapController;
  RxBool isLocationRetrieved = false.obs;
  BitmapDescriptor? customMarker;
  CoursesModel? selectedCourse;

  @override
  void onInit() async {
    super.onInit();
    await getCurrentLocation();
    await loadCustomMarker();
  }

  Future<void> getCurrentLocation() async {
    try {
      final status = await Permission.location.request();
      if (status.isGranted) {
        currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
        );
        isLocationRetrieved.value = true;
        update();
        print('currentPosition bla bla: $currentPosition');
      } else {
        isLocationRetrieved.value = false;
        print('Permission denied');
      }
    } catch (e) {
      isLocationRetrieved.value = false;
      print(e);
    }
  }

  Future<void> loadCustomMarker() async {
    try {
      final ByteData byteData =
          await rootBundle.load('assets/icon_map1.png');
      final Uint8List imageData = byteData.buffer.asUint8List();
      customMarker = BitmapDescriptor.fromBytes(imageData);
    } catch (e) {
      print('Failed to load custom marker image: $e');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}


