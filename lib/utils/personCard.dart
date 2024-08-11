import 'package:epsp/controller/dataBase.dart';
import 'package:epsp/controller/viewController.dart';
import 'package:epsp/utils/addDialog.dart';
import 'package:epsp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PersonCard extends StatelessWidget {
  String name;
  String birthDate;
  String birthPalce;
  String father;
  String mother;
  String state;
  String sex;
  RxBool checked;
  int id;
  PersonCard(
      {super.key,
      required this.id,
      required this.name,
      required this.birthDate,
      required this.birthPalce,
      required this.father,
      required this.mother,
      required this.state,
      required this.sex,
      required this.checked});
  DataBaseController _controller = Get.put(DataBaseController());
  ViewController _viewcontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(),
      padding: EdgeInsets.only(left: 20.w),
      color: Colors.white,
      height: 85.h,
      width: 1500.w,
      child: Row(
        children: [
          Obx(
            () {
              return Checkbox(
                side: BorderSide(width: 1),
                value: checked.value,
                onChanged: (value) {
                  print(id);
                  checked.value = value!;
                  if (value == true) {
                    DataBaseController.deletedList.add(id);
                  } else {
                    DataBaseController.deletedList.remove(id);
                  }
                  for (var element in DataBaseController.deletedList) {
                    print(element);
                  }
                },
              );
            },
          ),
          Container(
            width: 290.w,
            margin: EdgeInsets.only(left: 115.w),
            child: Text(
              "$name ${sex.isEmpty == false ? "(${sex[0]})" : ""}",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.sp),
            ),
          ),
          Container(
            width: 290.w,
            child: Text(
              birthDate,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.sp),
            ),
          ),
          Container(
            width: 290.w,
            child: Text(
              birthPalce,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.sp),
            ),
          ),
          Container(
              width: 230.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    father,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 17.sp),
                  ),
                  Text(
                    mother,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 17.sp),
                  ),
                ],
              )),
          Container(
            width: 150.w,
            child: Text(
              "non-vacciné",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.sp),
            ),
          ),
          InkWell(
            onTap: () {
              _controller.adding = false;
              _controller.idToUpadte = id;
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: DIalogPage(
                      widget: Container(
                        margin: EdgeInsets.only(right: 50.w, bottom: 50.h),
                        width: 125.r,
                        height: 50.r,
                        decoration: BoxDecoration(
                            color: lightBlue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 25.w, right: 10.w),
                              width: 25.r,
                              height: 25.r,
                              child: Image.asset(
                                "assets/icons/edit.png",
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Edit",
                              style: TextStyle(color: blue, fontSize: 17.sp),
                            )
                          ],
                        ),
                      ),
                      initList: _viewcontroller
                          .initList(_controller.getVaccinData(id)),
                      name: TextEditingController(text: name),
                      father: TextEditingController(text: father),
                      mother: TextEditingController(text: mother),
                      birthDate: TextEditingController(text: birthDate),
                      birthPlace: TextEditingController(text: birthPalce),
                      sex: TextEditingController(text: sex),
                    ),
                  );
                },
              );
            },
            child: Container(
              width: 32.r,
              height: 32.r,
              child: Image.asset("assets/icons/edit.png"),
            ),
          )
        ],
      ),
    );
  }
}
