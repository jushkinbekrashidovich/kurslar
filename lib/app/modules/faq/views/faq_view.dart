import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kurslar/app/const/app_colors.dart';
import 'package:kurslar/app/const/custom_widgets/custom_faq.dart';

import '../controllers/faq_controller.dart';

class FaqView extends GetView<FaqController> {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ko'p so'raladigan savollar"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: const [
            CustomFAQ(
              title: "Kurslar ilovasi nima?",
              description:
                  "Kurslar ilovasi bu O'zbekiston bo'ylab barcha o'quv markaz hamda kurslar haqida ma'lumotlarni o'z ichiga jamlagan mobil ilova. Ilova orqali o'zingizga maqul bo'lgan o'quv kurslari haqida ma'lumot olishingiz, ularni qidirishingiz va sizga eng yaqin joylashgan o'quv kurslarini topishingiz mumkin. Va shuningdek maqolalar bo'limida ta'limga oid foydali maqolalarni o'qishingiz mumkin!",
            ),
            SizedBox(
              height: 10,
            ),
            CustomFAQ(
              title: "Qidiruv qanday ishlaydi?",
              description:
                  "Bosh sahifada kurslar,o'quv markazlarni qidirish imkoni mavjud. Siz o'zingiz xohlagan \n fan nomi \n joylashuv joyi \n yoki o'quv markaz nomini qidirish orqali batafsil ma'lumot olishingiz mumkin.",
            ),
            SizedBox(
              height: 10,
            ),
            CustomFAQ(title: "Ilovada yana qanday qulayliklar mavjud?", description: "Ilova orqali o'quv markaz haqida barcha ma'lumotlarni topishingiz mumkin: \n➡ O'quv markaz nomi \n➡ Joylashuv manzili \n➡ Barcha aloqa sahifa va telefon raqamlari \n➡ Va ilovadan chiqmasdan o'quv markaz joylashgan manzilini aniqlashingiz mumkin\n➡ o'quv markazda mavjud bo'lgan o'quv kurslari"),
            SizedBox(height: 10,),
            CustomFAQ(title: "Yaqindagi kurslar bu qanday ishlaydi?", description: "Uyingizdan chiqmasdan siz o'zingizga yaqin bo'lgan kurslarni ilova orqali topishingiz mumkin!. Yaqindagi kurslar bu sizga sizga yaqin bo'lgan barcha o'quv markazlar joylashuvini xaritada ko'rsatadi. Ularni ustiga bosib ular haqida ma'lumot olishingiz mumkin"),
            SizedBox(height: 10,),
            CustomFAQ(
                title: "E'lonni saqlab qo'yish imkoni mavjudmi?",
                description:
                    "Har bir e'lonni 'saqlash' belgisini bosgan holda saqlanganlar ro'yxatiga qo'shishingiz mumkin va uni tezda topishingiz mumkin."),
            SizedBox(
              height: 10,
            ),
            CustomFAQ(
                title: "Maqolalar bo'limi nima?",
                description:
                    "Maqolalar sahifasida ta'limga oid mavzularda maqola va yangiliklar joylab boriladi."),

          ],
        ),
      ),
    );
  }
}
