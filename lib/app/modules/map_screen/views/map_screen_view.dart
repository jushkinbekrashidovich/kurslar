import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kurslar/app/data/models/courses_model.dart';
import 'package:kurslar/app/modules/home/controllers/home_controller.dart';

import '../controllers/map_screen_controller.dart';

class MapScreenView extends GetView<MapScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MapScreenView'),
        centerTitle: true,
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controllerNew) {
          controller.googleMapController = controllerNew;
          controller.googleMapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
              target:
                  LatLng(controller.currentPosition.latitude, controller.currentPosition.longitude),
              zoom: 90.0,
            ),
          ));
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(0, 0),
          zoom: 90.0,
        ),
        markers: Get.find<HomeController>().filteredCourses.map((CoursesModel coursePlaces) {
          return Marker(
            markerId: MarkerId(coursePlaces.school_name.toString()),
            position: LatLng(double.parse(coursePlaces.latitude_location.toString()), double.parse(coursePlaces.longtitude_location.toString())),
            infoWindow: InfoWindow(
              title: "Hiiii"+coursePlaces.school_name.toString(),
              snippet: "Hiaiaiiaiiaiai"
            ),
          );
        }).toSet(),
      ),
    );
  }
}
