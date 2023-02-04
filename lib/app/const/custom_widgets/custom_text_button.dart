import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, this.title, this.function});

  final String? title;
  final Function? function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        title.toString(),
        style: TextStyle(fontSize: 14),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          //to set border radius to button
          borderRadius: BorderRadius.circular(6),
        ),
        padding: EdgeInsets.all(15),
        primary: Colors.blueAccent,
      ),
      onPressed: () {
        function!();
      },
    );
  }
}
