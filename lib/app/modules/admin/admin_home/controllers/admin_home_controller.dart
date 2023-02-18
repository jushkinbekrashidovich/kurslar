import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurslar/app/const/custom_services/custom_snackbar.dart';
import 'package:kurslar/app/data/models/courses_model.dart';
import 'package:kurslar/app/routes/app_pages.dart';

class AdminHomeController extends GetxController {
  //TODO: Implement AdminHomeController

  late TextEditingController titleController;
  late TextEditingController imageUrl;
  late TextEditingController phoneNumber;
  late TextEditingController description;

  late TextEditingController latitudeLocation;
  late TextEditingController longtitudeLocation;
  late TextEditingController address;

  late TextEditingController telegramLink;
  late TextEditingController facebookLink;
  late TextEditingController instagramLink;
  late TextEditingController websiteLink;

  RxList<TextEditingController> subjectListController =
      [TextEditingController()].obs;

  addTextField() {
    subjectListController.add(TextEditingController());

    for (TextEditingController controller in subjectListController) {
      String text = controller.text;
      print("List of subjects" + text.toString());
      // Do something with the text value
    }
  }

  removeTextField(index) {
    subjectListController[index].clear();
    subjectListController[index].dispose();
    subjectListController.removeAt(index);
  }

  final count = 0.obs;
  @override
  void onInit() {
    titleController = TextEditingController();
    imageUrl = TextEditingController();
    address = TextEditingController();
    latitudeLocation = TextEditingController();
    longtitudeLocation = TextEditingController();
    phoneNumber = TextEditingController();
    description = TextEditingController();

    telegramLink = TextEditingController();
    facebookLink = TextEditingController();
    instagramLink = TextEditingController();
    websiteLink = TextEditingController();

    super.onInit();
  }

  Future<void> addCourse() async {
    CoursesModel coursesModel = CoursesModel();
    coursesModel.address = address.text;
    coursesModel.school_name = titleController.text;
    coursesModel.description = description.text;
    coursesModel.address = address.text;
    coursesModel.latitude_location = latitudeLocation.text;
    coursesModel.longtitude_location = longtitudeLocation.text;
    coursesModel.image_url = imageUrl.text;
    coursesModel.instagram_link = instagramLink.text;
    coursesModel.facebook_link = facebookLink.text;
    coursesModel.website_link = websiteLink.text;
    coursesModel.telegram_link = telegramLink.text;
    coursesModel.subjects =
        subjectListController.map((controller) => controller.text).toList();

    FirebaseFirestore.instance
        .collection("courses")
        .add(coursesModel.toJson())
        .then((value) {
      
      Get.offAllNamed(Routes.MAIN);
    }).catchError((e) {
      showErrorSnackbar(e.toString());
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  @override
  void dispose() {
    titleController.dispose();
    imageUrl.dispose();
    description.dispose();
    latitudeLocation.dispose();
    longtitudeLocation.dispose();
    address.dispose();
    phoneNumber.dispose();

    telegramLink.dispose();
    websiteLink.dispose();
    instagramLink.dispose();
    facebookLink.dispose();

    //subjectListController.toList().dispose();

    super.dispose();
  }
}
