import 'package:epsp/controller/dataBase.dart';
import 'package:epsp/controller/viewController.dart';
import 'package:epsp/model/model.dart';
import 'package:epsp/utils/addDialog.dart';
import 'package:epsp/utils/colors.dart';
import 'package:epsp/utils/personCard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final DataBaseController _controller = Get.put(DataBaseController());
  final ViewController _viewController = Get.put(ViewController());
  Future init() async {
    _viewController.list = [];
  }

  bool changeBehave = false;
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
            SingleChildScrollView(
              child: Column(
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
                            onChanged: (value) {
                              print(value);
                              DataBaseController.filter = value;
                              _controller.getData();
                            },
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
                            InkWell(
                              overlayColor: const WidgetStatePropertyAll(
                                  Colors.transparent),
                              onTap: () async {
                                for (var element
                                    in DataBaseController.deletedList) {
                                  _controller.deleteData(element);
                                }
                                bool isEmpty = await _controller.isTableEmpty(
                                    DataBaseController.database, "PERSONS");
                                if (isEmpty) {
                                  _controller.list.value = [];
                                } else {
                                  _controller.getData();
                                }
                                for (var element in _controller.list) {
                                  int newId = 0;
                                  await _controller.updatePerson(
                                      element["id"],
                                      Model(
                                          id: newId,
                                          name: element["name"],
                                          birthDate: element["birthDate"],
                                          birthPlace: element["birthPlace"],
                                          father: element["father"],
                                          mother: element["mother"],
                                          state: element["state"],
                                          sex: element["sex"]));
                                  newId++;
                                }
                                if (changeBehave == false) {
                                  for (var element
                                      in DataBaseController.deletedList) {
                                    ViewController.checkedList
                                        .removeAt(element);
                                    print(ViewController.checkedList.length);
                                  }
                                } else {
                                  ViewController.checkedList.clear();
                                }

                                DataBaseController.deletedList.clear();
                                _viewController.allChecked.value = false;
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 25.w),
                                width: 150.r,
                                height: 50.r,
                                decoration: BoxDecoration(
                                    color: red,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 25.r, right: 10.r),
                                      width: 25.r,
                                      height: 25.r,
                                      child: Image.asset(
                                          "assets/icons/delete.png"),
                                    ),
                                    Text(
                                      "Effacer",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17.sp),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              overlayColor:
                                  WidgetStatePropertyAll(Colors.transparent),
                              onTap: () {
                                _controller.adding = true;
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                        child: DIalogPage(
                                      widget: Container(
                                        margin: EdgeInsets.only(
                                            right: 50.w, bottom: 50.h),
                                        width: 150.r,
                                        height: 50.r,
                                        decoration: BoxDecoration(
                                            color: lightBlue,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 25.w, right: 10.w),
                                              width: 25.r,
                                              height: 25.r,
                                              child: Image.asset(
                                                  "assets/icons/add.png"),
                                            ),
                                            Text(
                                              "Ajouter",
                                              style: TextStyle(
                                                  color: blue, fontSize: 17.sp),
                                            )
                                          ],
                                        ),
                                      ),
                                      initList: init(),
                                      name: TextEditingController(),
                                      father: TextEditingController(),
                                      mother: TextEditingController(),
                                      birthDate: TextEditingController(),
                                      birthPlace: TextEditingController(),
                                      sex: TextEditingController(),
                                    ));
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
                                      margin: EdgeInsets.only(
                                          left: 25.r, right: 10.r),
                                      width: 25.r,
                                      height: 25.r,
                                      child:
                                          Image.asset("assets/icons/add.png"),
                                    ),
                                    Text(
                                      "Ajouter",
                                      style: TextStyle(
                                          color: blue, fontSize: 17.sp),
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
                    width: 1500.w,
                    height: 920.h,
                    decoration: BoxDecoration(color: lightGray),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.w),
                            height: 85.h,
                            child: Row(
                              children: [
                                Obx(
                                  () {
                                    return Checkbox(
                                        side: const BorderSide(width: 1),
                                        value: _viewController.allChecked.value,
                                        onChanged: (value) {
                                          _viewController.allChecked.value =
                                              value!;
                                          for (int i = 0;
                                              i < _controller.list.length;
                                              i++) {
                                            ViewController
                                                .checkedList[i].value = value;
                                            if (value == true) {
                                              DataBaseController.deletedList
                                                  .add(i);
                                              changeBehave = true;

                                              print(DataBaseController
                                                  .deletedList.length);
                                            } else if (value == false) {
                                              changeBehave = false;
                                              DataBaseController.deletedList
                                                  .clear();
                                            }
                                          }
                                        });
                                  },
                                ),
                                Container(
                                  width: 290.w,
                                  margin: EdgeInsets.only(left: 115.w),
                                  child: Text(
                                    "Nom et Prénom",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17.sp),
                                  ),
                                ),
                                Container(
                                  width: 290.w,
                                  child: Text(
                                    "Date de naissance",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17.sp),
                                  ),
                                ),
                                Container(
                                  width: 290.w,
                                  child: Text(
                                    "Lieu de naissance",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17.sp),
                                  ),
                                ),
                                Container(
                                  width: 230.w,
                                  child: Text(
                                    "Les parents",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17.sp),
                                  ),
                                ),
                                Container(
                                  width: 150.w,
                                  child: Text(
                                    "Statut",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Obx(
                            () {
                              return Container(
                                height: 85.h * _controller.list.length,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: _controller.list.length,
                                  itemBuilder: (context, index) {
                                    return PersonCard(
                                      id: _controller.list[index]["id"],
                                      name: _controller.list[index]["name"],
                                      birthDate: _controller.list[index]
                                          ["birthDate"],
                                      birthPalce: _controller.list[index]
                                          ["birthPlace"],
                                      father: _controller.list[index]["father"],
                                      mother: _controller.list[index]["mother"],
                                      sex: _controller.list[index]["sex"],
                                      state: _controller.list[index]["state"],
                                      checked:
                                          ViewController.checkedList[index],
                                    );
                                  },
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
