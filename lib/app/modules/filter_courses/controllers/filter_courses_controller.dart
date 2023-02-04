import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/sort_vars.dart';

class FilterCoursesController extends GetxController {
  //TODO: Implement FilterCoursesController
 TextEditingController nameController = TextEditingController();

  var sortByRegion = SortByRegion.Barchasi.name.obs;
  List<DropdownMenuItem<String>>? getDropDownItemRegion() {
     List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        value: SortByRegion.Barchasi.name,
        child: Text(SortByRegion.Barchasi.name),

        ),
       DropdownMenuItem(
        value: SortByRegion.Toshkent.name,
        child: Text(SortByRegion.Toshkent.name),

        ),
        DropdownMenuItem(
        value: SortByRegion.ToshkentViloyati.name,
        child: Text(SortByRegion.ToshkentViloyati.name),

        ),
        DropdownMenuItem(
        value: SortByRegion.Sirdaryo.name,
        child: Text(SortByRegion.Sirdaryo.name),

        ),
        DropdownMenuItem(
        value: SortByRegion.Jizzax.name,
        child: Text(SortByRegion.Jizzax.name),

        ),
        DropdownMenuItem(
        value: SortByRegion.Samarqand.name,
        child: Text(SortByRegion.Samarqand.name),

        ),
        DropdownMenuItem(
        value: SortByRegion.Qashqadaryo.name,
        child: Text(SortByRegion.Qashqadaryo.name),

        ),
        DropdownMenuItem(
        value: SortByRegion.Surxondaryo.name,
        child: Text(SortByRegion.Surxondaryo.name),

        ),
        DropdownMenuItem(
        value: SortByRegion.Navoiy.name,
        child: Text(SortByRegion.Navoiy.name),

        ),
        DropdownMenuItem(
        value: SortByRegion.Xorazm.name,
        child: Text(SortByRegion.Xorazm.name),

        ),
        DropdownMenuItem(
        value: SortByRegion.Buxoro.name,
        child: Text(SortByRegion.Buxoro.name),

        ),
        DropdownMenuItem(
        value: SortByRegion.Qoraqalpogiston.name,
        child: Text(SortByRegion.Qoraqalpogiston.name),

        ),
        DropdownMenuItem(
        value: SortByRegion.Namangan.name,
        child: Text(SortByRegion.Namangan.name),

        ),
        DropdownMenuItem(
        value: SortByRegion.Andijon.name,
        child: Text(SortByRegion.Andijon.name),

        ),
        DropdownMenuItem(
        value: SortByRegion.Fargona.name,
        child: Text(SortByRegion.Fargona.name),

        ),
     ];
     return menuItems;
  }


  stateItemRegion(String? value){
    sortByRegion.value = value.toString() ;
    update();

  }

  var sortByPrice = SortByPrice.Barchasi.name.obs;

  List<DropdownMenuItem<String>>? getDropDownItemPrice() {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        value: SortByPrice.Barchasi.name,
        child: Text(SortByPrice.Barchasi.name),

        ),
         DropdownMenuItem(
        value: SortByPrice.EngYuqoriNarx.name,
        child: Text(SortByPrice.EngYuqoriNarx.name),

        ),
         DropdownMenuItem(
        value: SortByPrice.EngPastNarx.name,
        child: Text(SortByPrice.EngPastNarx.name),

        ),

    ];
    return menuItems;

  }

  stateItemPrice(String? value){
    sortByPrice.value = value.toString() ;
    update();

  }


  var sortByTime = SortByTime.Barchasi.name.obs;

  List<DropdownMenuItem<String>>? getDropDownItemTime() {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        value: SortByTime.Barchasi.name,
        child: Text(SortByTime.Barchasi.name),

        ),
        DropdownMenuItem(
        value: SortByTime.Yaqinda.name,
        child: Text(SortByTime.Yaqinda.name),

        ),
        DropdownMenuItem(
        value: SortByTime.Eski.name,
        child: Text(SortByTime.Eski.name),
        ),

    ];
    return menuItems;

  }

  stateItemTime(String? value){
    sortByTime.value = value.toString() ;
    update();

  }
  


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
}
