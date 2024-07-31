import 'package:epsp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldD extends StatelessWidget {
  String title;
  Widget? widget;
  int width;
  TextEditingController textController;
  bool readOnly = false;
  TextFieldD(
      {required this.textController,
      required this.title,
      required this.widget,
      required this.readOnly,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5.r),
            child: Text(
              title,
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
          Container(
              height: 50.r,
              width: width.r,
              child: TextField(
                controller: textController,
                readOnly: readOnly,
                style: TextStyle(fontSize: 17.sp),
                decoration: InputDecoration(
                    suffixIcon: widget,
                    contentPadding: EdgeInsets.only(bottom: 13.r, left: 15.r),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: blue))),
              )),
        ],
      ),
    );
  }
}
