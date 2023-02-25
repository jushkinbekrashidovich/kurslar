import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';
import 'package:kurslar/app/modules/news/views/news_view.dart';
import 'package:kurslar/app/modules/settings/views/settings_view.dart';

import '../../../const/app_colors.dart';
import '../../home/views/home_view.dart';
import '../../saved/views/saved_view.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: IndexedStack(
            index: controller.bottomMenu.value.index,
            children: [
              HomeView(),
              SavedView(),
              NewsView(),
              SettingsView(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: AppColors.black,
            selectedItemColor: AppColors.mainColor7,
            onTap: (pos) {
              return controller.setMenu(BottomMenu.values[pos]);
              
            },
                
            currentIndex: controller.bottomMenu.value.index,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.white,
            selectedLabelStyle: GoogleFonts.poppins(
              fontSize: 11.2,
            ),
            unselectedLabelStyle:
                GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400),
            elevation: 8,
            items: [
              _bottomNavigationBarItem(
                icon: 'home',
                label: "Bosh Sahifa",
                activeIcon: 'home_active',
              ),
              _bottomNavigationBarItem(
                icon: 'saved',
                label: "Saqlanganlar".tr,
                activeIcon: 'saved_active',
              ),
              _bottomNavigationBarItem(
                icon: 'news',
                label: "Maqolalar".tr,
                activeIcon: 'news_active',
              ),
              _bottomNavigationBarItem(
                icon: 'settings',
                label: "Sozlamalar".tr,
                activeIcon: 'settings_active',
              ),
            ],
          ),
        ));
  }

  _bottomNavigationBarItem({
    required String activeIcon,
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.white,
      //backgroundColor: AppColors.white,
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Container(
            height: 20,
            width: 20,
            child: SvgPicture.asset('assets/icons/$icon.svg')),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Container(
            height: 20,
            width: 20,
            child: SvgPicture.asset('assets/icons/$activeIcon.svg')),
      ),
      label: label,
    );
  }
}
