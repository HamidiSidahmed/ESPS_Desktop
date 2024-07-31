import 'package:epsp/utils/addDialog.dart';
import 'package:epsp/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Container(
            height: 1.sh,
            width: 325.w,
            color: blue,
            child: Column(
              children: [
                Container(
                  width: 325.w,
                  height: 150.h,
                  child: Stack(
                    children: [
                      Container(
                        height: 150.r,
                        width: 150.r,
                        child: Image.asset("assets/image/logo.png"),
                      ),
                      Positioned(
                        left: 125.r,
                        top: 60.r,
                        child: Container(
                          child: Text(
                            "EPSP DE TENES",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 325.w,
                  height: 70.h,
                  margin: EdgeInsets.only(top: 20.h),
                  color: lightBlue.withOpacity(0.3),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 25.w, right: 25.w),
                        width: 25.r,
                        height: 25.r,
                        child: Image.asset("assets/icons/home.png",
                            fit: BoxFit.cover),
                      ),
                      InkWell(
                        onTap: () {
                          print(MediaQuery.of(context).size);
                        },
                        child: Text(
                          "Home",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 188.9.w),
                        height: 70.h,
                        width: 15.w,
                        color: lightBlue,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25.h),
                  width: 325.w,
                  height: 70.h,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 25.r, right: 25.r),
                        width: 25.r,
                        height: 25.r,
                        child: Image.asset(
                          "assets/icons/statistics.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        "Statistics",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 139.5.w),
                        height: 70.h,
                        width: 15.w,
                        color: Colors.transparent,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              Container(
                width: 1500.w,
                margin: EdgeInsets.only(top: 50.h, left: 50.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50.r,
                      width: 300.r,
                      child: TextField(
                        style: TextStyle(fontSize: 17.sp),
                        decoration: InputDecoration(
                            hintText: "Chercher pour une persone",
                            contentPadding:
                                EdgeInsets.only(bottom: 13.r, left: 15.r),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: blue)),
                            focusColor: blue,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: blue)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: blue))),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 25.w),
                          width: 150.r,
                          height: 50.r,
                          decoration: BoxDecoration(
                              color: red,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(left: 25.r, right: 10.r),
                                width: 25.r,
                                height: 25.r,
                                child: Image.asset("assets/icons/delete.png"),
                              ),
                              Text(
                                "Effacer",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17.sp),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(child: DIalogPage());
                              },
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 50.r),
                            width: 150.r,
                            height: 50.r,
                            decoration: BoxDecoration(
                                color: lightBlue,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 25.r, right: 10.r),
                                  width: 25.r,
                                  height: 25.r,
                                  child: Image.asset("assets/icons/add.png"),
                                ),
                                Text(
                                  "Ajouter",
                                  style:
                                      TextStyle(color: blue, fontSize: 17.sp),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 60.h, left: 50.w),
                padding: EdgeInsets.only(top: 10.h, left: 20.w),
                width: 1500.w,
                height: 900.h,
                decoration: BoxDecoration(color: lightGray),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          side: BorderSide(width: 1),
                          value: false,
                          onChanged: (value) {},
                        ),
                        Container(
                          width: 290.w,
                          margin: EdgeInsets.only(left: 115.w),
                          child: Text(
                            "Nom et Prénom",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17.sp),
                          ),
                        ),
                        Container(
                          width: 290.w,
                          child: Text(
                            "Date de naissance",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17.sp),
                          ),
                        ),
                        Container(
                          width: 290.w,
                          child: Text(
                            "Lieu de naissance",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17.sp),
                          ),
                        ),
                        Container(
                          width: 290.w,
                          child: Text(
                            "Les parents",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17.sp),
                          ),
                        ),
                        Container(
                          width: 150.w,
                          child: Text(
                            "Statut",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17.sp),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
