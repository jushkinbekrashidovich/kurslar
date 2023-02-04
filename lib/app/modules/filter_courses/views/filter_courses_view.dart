
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kurslar/app/modules/filter_courses/controllers/filter_courses_controller.dart';

import '../../../const/app_colors.dart';
import '../../../const/custom_widgets/custom_text_button.dart';


class FilterCoursesView extends GetView<FilterCoursesController> {
  const FilterCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        shadowColor: Colors.grey,
        title: Text('Filter'),
        centerTitle: true,
        elevation: 0.2,
        scrolledUnderElevation: 0.2,
      ),
      body:  Padding(
          padding: const EdgeInsets.only(top: 45, left: 15, right: 15),
          child: ListView(
            children: [
              Text(
                "Filtrlar",
                style: GoogleFonts.urbanist(
                    fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Joylashuv".toUpperCase(),
                style: TextStyle(
                  color: Color.fromARGB(255, 189, 204, 216),
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              DropdownButton(
                isExpanded: true,
                value: controller.sortByRegion.value,
                items: controller.getDropDownItemRegion(),
                onChanged: (String? value) {
                  controller.stateItemRegion(value);
                },
                iconEnabledColor: AppColors.mainColor,
                iconSize: 27,
                icon: Icon(CupertinoIcons.arrow_down_square),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Narx".toUpperCase(),
                style: TextStyle(
                  color: Color.fromARGB(255, 189, 204, 216),
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              DropdownButton(
                isExpanded: true,
                value: controller.sortByPrice.value,
                items: controller.getDropDownItemPrice(),
                onChanged: (String? value) {
                  controller.stateItemPrice(value);
                },
                iconEnabledColor: AppColors.mainColor,
                iconSize: 27,
                icon: Icon(CupertinoIcons.arrow_down_square),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Joylangan e'lon vaqti".toUpperCase(),
                style: TextStyle(
                  color: Color.fromARGB(255, 189, 204, 216),
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              DropdownButton(
                
                isExpanded: true,
                value: controller.sortByTime.value,
                items: controller.getDropDownItemTime(),
                onChanged: (String? value) {
                  controller.stateItemTime(value);
                },
                iconEnabledColor: AppColors.mainColor,
                iconSize: 27,
                icon: Icon(CupertinoIcons.arrow_down_square),
              ),
              SizedBox(height: 20,),
              CustomTextButton(function: (){},
              title: "Saqlash",)
            ],
          ),
        ),
      ),
    );
  }
}
