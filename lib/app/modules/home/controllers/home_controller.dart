import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kurslar/app/const/custom_widgets/custom_snackbars.dart';
import 'package:kurslar/app/data/models/courses_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  late FirebaseFirestore firebaseFirestore;

  TextEditingController searchController = TextEditingController();
  late final FocusNode focusNode;

  RxBool isLoading = true.obs;

  final courses = <CoursesModel>[].obs;

  final filteredCourses = <CoursesModel>[].obs;

  final RxBool isFavorite = false.obs;

  @override
  void onInit() {
    focusNode = FocusNode();
    firebaseFirestore = FirebaseFirestore.instance;

    super.onInit();
  }

  @override
  void onReady() async {
    isLoading.value = true;
    try {
      courses.value = await getCourses();
      filteredCourses.value = courses.value;
    } catch (e) {
      print(e.toString());
      showErrorSnackbar(e.toString());
    }
    isLoading.value = false;
    super.onReady();
  }

  Future<List<CoursesModel>> getCourses() async {
    final List<CoursesModel> coursesModelList = [];
    await firebaseFirestore.collection("courses").get().then((snapshot) {
      for (var element in snapshot.docs) {
        final data = CoursesModel.fromJson(element.data());
        data.post_id = element.id;
        coursesModelList.add(data);
      }
    });
    return coursesModelList;
  }

  Future<void> filterSearchResults(String query) async {
    List<CoursesModel> searchList = <CoursesModel>[];
    searchList.addAll(courses.value);
    if (query.isNotEmpty) {
      List<CoursesModel> dummyListData = <CoursesModel>[];
      searchList.forEach((item) {
        if (item.school_name
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase()) ||  item.address.toString().toLowerCase().contains(query.toLowerCase())
            ||  item.subjects!.any((subject) => subject.toLowerCase().contains(query.toLowerCase()))
            ) {
          dummyListData.add(item);
        }
      });
      filteredCourses.value = dummyListData;
    } else {
      filteredCourses.value = courses.value;
    }
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  
}
