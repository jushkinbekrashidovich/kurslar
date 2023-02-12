import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreenController extends GetxController {
  //TODO: Implement MapScreenController
  
  final Geolocator geolocator = Geolocator();

  late Position currentPosition;
  late GoogleMapController googleMapController;

   @override
  void onInit() {
    getCurrentLocation();
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getCurrentLocation() async {
  try {
    currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  } catch (e) {
    print(e);
  }
}
}
