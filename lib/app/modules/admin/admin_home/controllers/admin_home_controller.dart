import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      print("List of subjects"+text.toString());
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
