import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kurslar/app/const/app_colors.dart';
import 'package:kurslar/app/const/custom_widgets/custom_admin_text_fileds.dart';
import 'package:kurslar/app/const/custom_widgets/custom_sub_title.dart';

import '../controllers/admin_home_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            title: Text("Hi, John"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.publish),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.update),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.send),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
            child: ListView(
              children: [
                CustomAdminTextField(
                    hintText: "Title", controller: controller.titleController),
                const SizedBox(
                  height: 18,
                ),
                CustomAdminTextField(
                    hintText: "ImageUrl", controller: controller.titleController),
                const SizedBox(
                  height: 18,
                ),
                CustomAdminTextField(
                    hintText: "PhoneNumber", controller: controller.titleController),
                const SizedBox(
                  height: 18,
                ),
                CustomAdminTextField(
                    hintText: "Description", controller: controller.titleController),
                const SizedBox(
                  height: 18,
                ),
                CustomAdminTextField(
                    hintText: "Latitude", controller: controller.titleController),
                        const SizedBox(
                  height: 18,
                ),
                CustomAdminTextField(
                    hintText: "Longtitude", controller: controller.titleController),
                           const SizedBox(
                  height: 18,
                ),
                CustomAdminTextField(
                    hintText: "Address", controller: controller.titleController),
                           const SizedBox(
                  height: 18,
                ),
                CustomAdminTextField(
                    hintText: "Telegram", controller: controller.titleController),
                           const SizedBox(
                  height: 18,
                ),
                CustomAdminTextField(
                    hintText: "Facebook", controller: controller.titleController),
                           const SizedBox(
                  height: 18,
                ),
                CustomAdminTextField(
                    hintText: "Instagram", controller: controller.titleController),
                           const SizedBox(
                  height: 18,
                ),
                CustomAdminTextField(
                    hintText: "Website", controller: controller.titleController),
                           const SizedBox(
                  height: 18,
                ),
                
                    
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Fanlar",
                      style: TextStyle(fontSize: 25),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.addTextField();
                        // controller.addTextField();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.black,
                      ),
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.subjectListController.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width*0.78,
                              child: CustomAdminTextField(
                                  hintText: (index + 1).toString(),
                                  controller:
                                      controller.subjectListController[index]),
                            ),
                            //SizedBox(width: 10,),
                            index != 0
                                ? IconButton(
                                    onPressed: () {
                                      controller.removeTextField(index);
                                    },
                                    icon: Icon(Icons.delete),
                                  )
                                : SizedBox(),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
