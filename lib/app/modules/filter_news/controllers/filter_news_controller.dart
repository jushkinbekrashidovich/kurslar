import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurslar/app/const/sort_vars.dart';

class FilterNewsController extends GetxController {
  //TODO: Implement FilterNewsController

var sortByTime = SortByTimeNews.Barchasi.name.obs;

  List<DropdownMenuItem<String>>? getDropDownItemTime() {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        value: SortByTimeNews.Barchasi.name,
        child: Text(SortByTimeNews.Barchasi.name),

        ),
         DropdownMenuItem(
        value: SortByTimeNews.Yaqinda.name,
        child: Text(SortByPrice.EngYuqoriNarx.name),

        ),
         DropdownMenuItem(
        value: SortByTimeNews.Eski.name,
        child: Text(SortByPrice.EngPastNarx.name),

        ),

    ];
    return menuItems;

  }

  stateItemTime(String? value){
    sortByTime.value = value.toString() ;
    update();

  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
