import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kurslar/app/data/models/courses_model.dart';
import 'package:kurslar/app/modules/home/controllers/home_controller.dart';

import '../controllers/map_screen_controller.dart';

class MapScreenView extends GetView<MapScreenController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!controller.isLocationRetrieved.value) {
        return 
        Center(child: CircularProgressIndicator());
      }
      return Scaffold(
        appBar: AppBar(
          title: const Text("Sizga yaqin o'quv markazlar"),
          centerTitle: true,
        ),
        body: GoogleMap(
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controllerNew) {
            try {
              controller.googleMapController = controllerNew;
              controller.googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(
                      controller.currentPosition.latitude,
                      controller.currentPosition.longitude,
                    ),
                    zoom: 15.0,
                  ),
                ),
              );
            } catch (e) {
              print("Error creating GoogleMapController: $e");
            }
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(
              controller.currentPosition.latitude,
              controller.currentPosition.longitude,
            ),
            zoom: 15.0,
          ),
          markers: Get.find<HomeController>()
              .filteredCourses
              .map((CoursesModel coursePlaces) {
            return Marker(
              markerId: MarkerId(coursePlaces.school_name.toString()),
              icon: controller.customMarker!,
              position: LatLng(
                double.parse(coursePlaces.latitude_location.toString()),
                double.parse(coursePlaces.longtitude_location.toString()),
              ),
              infoWindow: InfoWindow(
                title: coursePlaces.school_name.toString(),
                snippet: coursePlaces.address.toString(),
              ),
            );
          }).toSet(),
        ),
      );
    });
  }
}
