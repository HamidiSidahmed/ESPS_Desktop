import 'package:epsp/controller/viewController.dart';
import 'package:epsp/utils/addDialog.dart';
import 'package:epsp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddedData extends StatefulWidget {
  final String age;
  final String vaccin;
  final String technic;
  final String injectrionPlace;
  final String birthDate;
  final String lotNumber;

  int id;
  final List<AddedData> data;
  AddedData(
      {super.key,
      required this.id,
      required this.data,
      required this.age,
      required this.vaccin,
      required this.technic,
      required this.injectrionPlace,
      required this.birthDate,
      required this.lotNumber});

  @override
  State<AddedData> createState() => _AddedDataState();
}

class _AddedDataState extends State<AddedData>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
        animationBehavior: AnimationBehavior.normal);
    setState(() {
      _controller.forward();
    });
    super.initState();
  }

  ViewController _veiwcontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 500),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Container(
            width: 1500.w,
            margin: EdgeInsets.only(top: 25.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: 10.w, right: 10.w, top: 10.w, bottom: 10.w),
                  width: 200.r,
                  decoration: BoxDecoration(
                      color: lightGray,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      widget.age,
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 10.w, right: 10.w, top: 10.w, bottom: 10.w),
                  width: 200.r,
                  decoration: BoxDecoration(
                      color: lightGray,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      widget.vaccin,
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 10.w, right: 10.w, top: 10.w, bottom: 10.w),
                  width: 200.r,
                  decoration: BoxDecoration(
                      color: lightGray,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      widget.technic,
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 10.w, right: 10.w, top: 10.w, bottom: 10.w),
                  width: 200.r,
                  decoration: BoxDecoration(
                      color: lightGray,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      widget.injectrionPlace,
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 10.w, right: 10.w, top: 10.w, bottom: 10.w),
                  width: 200.r,
                  decoration: BoxDecoration(
                      color: lightGray,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      widget.birthDate,
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Container(
                  width: 200.r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 10.w, right: 10.w, top: 10.w, bottom: 10.w),
                        width: 150.r,
                        decoration: BoxDecoration(
                            color: lightGray,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            widget.lotNumber,
                            style: TextStyle(
                                fontSize: 17.sp, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _veiwcontroller.list.removeAt(widget.id);
                          int count = 0;
                          for (var element in _veiwcontroller.list) {
                            print(count);
                            element.id = count;
                            count = count + 1;
                          }
                          _veiwcontroller.update();
                        },
                        child: Container(
                          width: 30.r,
                          height: 30.r,
                          child: Image.asset("assets/icons/faux.png"),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
