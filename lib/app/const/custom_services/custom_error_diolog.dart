
import 'package:flutter/material.dart';
import 'package:kurslar/app/const/app_colors.dart';



class CustomErrorDialog extends StatelessWidget {
  final String text;

  CustomErrorDialog({required this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(
          "error",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.all(15),
        actionsPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular( 10.0))),
        content: Builder(
          builder: (context) {
            // Get available height and width of the build area of this widget. Make a choice depending on the size.
            var height = MediaQuery.of(context).size.height;
            var width = MediaQuery.of(context).size.width;

            return Container(
              //padding: EdgeInsets.all(50),
              //height: 50.h,
              width: 85,
              child: Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                //height: 100,
                decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
              ),
            );
          },
        ),
        actions: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      padding: EdgeInsets.all(15),
                      //width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        "ok",
                        style:
                            TextStyle(color: Colors.black87, fontSize: 15),
                      )),
                  style: ElevatedButton.styleFrom(
                    //padding: EdgeInsets.all(20),

                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.transparent,
                    //side: BorderSide(width: 1, color: Colors.green),
                    primary: Colors.black45, // <-- Button color
                    onPrimary: Colors.white, // <-- Splash color
                  ),
                ),
              ),
            ],
          )
        ]);
  }
}
