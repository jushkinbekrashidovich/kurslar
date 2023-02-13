import 'package:permission_handler/permission_handler.dart';
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
  void onInit() async{
    await getCurrentLocation();
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future getCurrentLocation() async {
    
  try {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission != LocationPermission.denied ||
        permission != LocationPermission.deniedForever) {
      currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium);
      return currentPosition;
    }
    // currentPosition = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.best);
  } catch (e) {
    print(e);
  }
}




}
