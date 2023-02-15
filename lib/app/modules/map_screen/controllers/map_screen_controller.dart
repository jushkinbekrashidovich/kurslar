import 'dart:async';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreenController extends GetxController {
  //TODO: Implement MapScreenController
  
  final Geolocator geolocator = Geolocator();

  late Position currentPosition;
  late GoogleMapController googleMapController;
  RxBool isLocationRetrieved = false.obs;
   BitmapDescriptor? customMarker;



   @override
  void onInit() async{
    await getCurrentLocation();

    ByteData byteData =  await rootBundle.load("assets/icon_map1.png");
   Uint8List imageData =   byteData.buffer.asUint8List();
   customMarker =  BitmapDescriptor.fromBytes(imageData);
  
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
        isLocationRetrieved.value = true;
        print('currentPosition bla bla: $currentPosition');
        update();
  } catch (e) {
    print(e);
  }
}
}

