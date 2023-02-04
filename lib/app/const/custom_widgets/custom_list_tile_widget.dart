import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:kurslar/app/const/app_colors.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.title,
      required this.leading,
      required this.function});

  final String title;
  final IconData leading;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        ListTile(
          leading: RawMaterialButton(
            constraints: BoxConstraints(maxHeight: 40, maxWidth: 40),
            onPressed: () {},
            elevation: 0.0,
            fillColor: AppColors.background,
            child: Icon(leading, size: 20,),
            padding: EdgeInsets.all(8.0),
            shape: CircleBorder(),
          ),
          title: Text(title),
          onTap: () {
            function();
          },
          trailing: Icon(
            Icons.arrow_forward_ios_outlined,
            size: 18,
          ),
        ),
        SizedBox(height: 5,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: DottedLine(
            dashColor: AppColors.grey,
          ),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
