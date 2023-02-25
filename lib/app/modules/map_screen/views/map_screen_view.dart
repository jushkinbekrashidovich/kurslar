import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kurslar/app/data/models/courses_model.dart';
import 'package:kurslar/app/modules/home/controllers/home_controller.dart';

import '../../../const/app_colors.dart';
import '../../../data/models/courses_details_argument.dart';
import '../../../routes/app_pages.dart';
import '../controllers/map_screen_controller.dart';

class MapScreenView extends GetView<MapScreenController> {
  const MapScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!controller.isLocationRetrieved.value) {
        return const Center(child: CircularProgressIndicator());
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
              onTap: () {
                Get.toNamed(
                  Routes.COURSES_DETAILS,
                  arguments: CoursesDetailsArguments(
                    address: coursePlaces.address,
                    phone_number: coursePlaces.phone_number,
                    school_name: coursePlaces.school_name,
                    description: coursePlaces.description,
                    facebook_link: coursePlaces.facebook_link,
                    website_link: coursePlaces.website_link,
                    instagram_link: coursePlaces.instagram_link,
                    telegram_link: coursePlaces.telegram_link,
                    image_url: coursePlaces.image_url,
                    latitude_location: coursePlaces.latitude_location,
                    longtitude_location: coursePlaces.longtitude_location,
                    subjects: coursePlaces.subjects,
                  ),
                );
              },
            );
          }).toSet(),
        ),
      );
    });
  }
}
