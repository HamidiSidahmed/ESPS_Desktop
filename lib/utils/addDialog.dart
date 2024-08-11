import 'package:epsp/controller/dataBase.dart';
import 'package:epsp/controller/viewController.dart';
import 'package:epsp/model/model.dart';

import 'package:epsp/controller/dataBase.dart';
import 'package:epsp/model/vaccin.dart';
import 'package:epsp/utils/addedData.dart';
import 'package:epsp/utils/colors.dart';
import 'package:epsp/utils/textFieldD.dart';
import 'package:epsp/view/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';

class DIalogPage extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController father = TextEditingController();
  TextEditingController mother = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  TextEditingController birthPlace = TextEditingController();
  TextEditingController sex = TextEditingController();
  TextEditingController ages = TextEditingController();
  TextEditingController vaccin = TextEditingController();
  TextEditingController technique = TextEditingController();
  TextEditingController injectionSite = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController lotnumber = TextEditingController();
  Future initList;
  Widget widget;
  DIalogPage(
      {super.key,
      required this.widget,
      required this.name,
      required this.father,
      required this.mother,
      required this.birthDate,
      required this.birthPlace,
      required this.sex,
      required this.initList});
  static List<AddedData> data = [];
  List<VaccinModel> vaccinData = [];

  List<PopupMenuEntry> naissance = [
    PopupMenuItem(
      child: Text(
        "BCG",
        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
      ),
      value: "BCG",
    ),
    PopupMenuItem(
      child: Text(
        "HBV",
        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
      ),
      value: "HBV",
    )
  ];

  List<PopupMenuEntry> twoMonthVaccin = [
    PopupMenuItem(
      child: Text(
        "DTCaVPI - Hib  - HBV",
        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
      ),
      value: "DTCaVPI",
    ),
    PopupMenuItem(
      child: Text(
        "VPC",
        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
      ),
      value: "VPC",
    ),
    PopupMenuItem(
      child: Text(
        "VPO",
        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
      ),
      value: "VPO",
    )
  ];

  DataBaseController _controller = Get.find();
  ViewController _viewcontroller = Get.put(ViewController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1700.r,
      height: 950.r,
      padding: EdgeInsets.only(top: 40.r, left: 50.r),
      color: Colors.white,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
                onTap: () async {
                  if (_controller.adding == true) {
                    for (var element in _viewcontroller.list) {
                      vaccinData.add(VaccinModel(
                          id: UniqueKey().toString(),
                          age: element.age,
                          vaccin: element.vaccin,
                          technic: element.technic,
                          place: element.injectrionPlace,
                          date: element.birthDate,
                          lot: element.lotNumber,
                          personId: _controller.list.length));
                    }
                    print("adding");
                    _controller.inseteData(
                      Model(
                          id: _controller.list.length,
                          name: name.text,
                          birthDate: birthDate.text,
                          birthPlace: birthPlace.text,
                          father: father.text,
                          mother: mother.text,
                          state: "",
                          sex: sex.text),
                    );
                    _controller.getData();
                    _controller.insertVaccin(vaccinData);
                  } else {
                    for (var element in _viewcontroller.list) {
                      vaccinData.add(VaccinModel(
                          id: UniqueKey().toString(),
                          age: element.age,
                          vaccin: element.vaccin,
                          technic: element.technic,
                          place: element.injectrionPlace,
                          date: element.birthDate,
                          lot: element.lotNumber,
                          personId: _controller.idToUpadte));
                    }
                    print("updating");
                    _controller.updatePerson(
                      _controller.idToUpadte,
                      Model(
                          id: _controller.idToUpadte,
                          name: name.text,
                          birthDate: birthDate.text,
                          birthPlace: birthPlace.text,
                          father: father.text,
                          mother: mother.text,
                          state: "",
                          sex: sex.text),
                    );
                    _controller.getData();

                    await DataBaseController.database.delete("VACCINS",
                        where: 'personid = ?',
                        whereArgs: [_controller.idToUpadte]);
                    _controller.insertVaccin(vaccinData);
                  }

                  _viewcontroller.list.clear();
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
                child: widget),
          ),
          Column(children: [
            Container(
              width: 1500.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFieldD(
                    textController: name,
                    title: "Nome et Prénom",
                    readOnly: false,
                    widget: null,
                    width: 200,
                  ),
                  TextFieldD(
                    textController: father,
                    readOnly: false,
                    title: "Prénom de pere",
                    widget: null,
                    width: 200,
                  ),
                  TextFieldD(
                    textController: mother,
                    readOnly: false,
                    title: "Nom et prénom de mere",
                    widget: null,
                    width: 200,
                  ),
                  TextFieldD(
                    textController: birthDate,
                    width: 200,
                    readOnly: true,
                    title: "Date de naissance",
                    widget: InkWell(
                      onTap: () {
                        showDatePicker(
                                context: context,
                                firstDate: DateTime(2002),
                                lastDate: DateTime(2025))
                            .then(
                          (value) {
                            value == null
                                ? value = DateTime.now()
                                : value = value;
                            birthDate.text =
                                DateFormat("dd/MM/yyyy").format(value);
                          },
                        );
                      },
                      child: Icon(
                        Icons.calendar_today_outlined,
                        size: 20.r,
                      ),
                    ),
                  ),
                  TextFieldD(
                    textController: birthPlace,
                    width: 200,
                    readOnly: false,
                    title: "Lieu de naissance",
                    widget: Icon(
                      Icons.place,
                      size: 20.r,
                    ),
                  ),
                  TextFieldD(
                    width: 200,
                    textController: sex,
                    readOnly: true,
                    title: "Sex",
                    widget: PopupMenuButton(
                      onSelected: (value) {
                        sex.text = value;
                      },
                      padding: EdgeInsets.only(bottom: 0),
                      icon: Icon(Icons.arrow_drop_down),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            child: Text("Garcon",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500)),
                            value: "Garcon",
                          ),
                          PopupMenuItem(
                            child: Text("Fille",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500)),
                            value: "Fille",
                          )
                        ];
                      },
                    ),
                  )
                ],
              ),
            ),
            GetBuilder<ViewController>(
              builder: (controller) {
                return Column(
                  children: _viewcontroller.list,
                );
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 25.r),
              width: 1500.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFieldD(
                    textController: ages,
                    title: "Age",
                    readOnly: false,
                    widget: PopupMenuButton(
                      onSelected: (value) {
                        ages.text = value;
                      },
                      padding: EdgeInsets.only(bottom: 0),
                      icon: Icon(Icons.arrow_drop_down),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            child: Text(
                              "A la naissance",
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                            value: "A la naissance",
                          ),
                          PopupMenuItem(
                            child: Text(
                              "2 mois",
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                            value: "2 mois",
                          ),
                          PopupMenuItem(
                            child: Text(
                              "4 mois",
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                            value: "4 mois",
                          ),
                          PopupMenuItem(
                            child: Text(
                              "11 mois",
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                            value: "11 mois",
                          ),
                          PopupMenuItem(
                            child: Text(
                              "12 mois",
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                            value: "12 mois",
                          ),
                          PopupMenuItem(
                            child: Text(
                              "18 mois",
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                            value: "18 mois",
                          )
                        ];
                      },
                    ),
                    width: 200,
                  ),
                  TextFieldD(
                    textController: vaccin,
                    readOnly: true,
                    title: "Vaccin",
                    widget: PopupMenuButton(
                      onSelected: (value) {
                        vaccin.text = value;
                      },
                      padding: EdgeInsets.only(bottom: 0),
                      icon: Icon(Icons.arrow_drop_down),
                      itemBuilder: (context) {
                        if (ages.text == "A la naissance") {
                          return naissance;
                        } else if (ages.text == "2 mois" ||
                            ages.text == "4 mois" ||
                            ages.text == "12 mois")
                          return twoMonthVaccin;
                        else if (ages.text == "11 mois" ||
                            ages.text == "18 mois") {
                          return [
                            PopupMenuItem(
                                value: "ROR",
                                child: Text(
                                  "ROR",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500),
                                )),
                          ];
                        } else {
                          return [PopupMenuItem(child: Text("data"))];
                        }
                      },
                    ),
                    width: 200,
                  ),
                  TextFieldD(
                      textController: technique,
                      readOnly: true,
                      title: "Voie d'administration",
                      widget: PopupMenuButton(
                        onSelected: (value) {
                          technique.text = value;
                        },
                        padding: EdgeInsets.only(bottom: 0),
                        icon: Icon(Icons.arrow_drop_down),
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              child: Text("IM",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500)),
                              value: "IM",
                            ),
                            PopupMenuItem(
                              child: Text("ID",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500)),
                              value: "ID",
                            ),
                            PopupMenuItem(
                              child: Text("PO",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500)),
                              value: "PO",
                            ),
                            PopupMenuItem(
                              child: Text("SC",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500)),
                              value: "SC",
                            ),
                          ];
                        },
                      ),
                      width: 200),
                  TextFieldD(
                      textController: injectionSite,
                      readOnly: false,
                      title: "Site d'injection",
                      widget: null,
                      width: 200),
                  TextFieldD(
                    textController: date,
                    width: 200,
                    readOnly: true,
                    title: "Date",
                    widget: InkWell(
                      onTap: () {
                        showDatePicker(
                                context: context,
                                firstDate: DateTime(2002),
                                lastDate: DateTime(2025))
                            .then(
                          (value) {
                            value == null
                                ? value = DateTime.now()
                                : value = value;
                            date.text = DateFormat("dd/MM/yyyy").format(value);
                          },
                        );
                      },
                      child: Icon(
                        Icons.calendar_today_outlined,
                        size: 20.r,
                      ),
                    ),
                  ),
                  Container(
                    width: 200.r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFieldD(
                            textController: lotnumber,
                            readOnly: false,
                            title: "N de lot",
                            widget: null,
                            width: 150),
                        InkWell(
                          onTap: () {
                            _viewcontroller.list.add(AddedData(
                                id: _viewcontroller.list.length,
                                data: data,
                                age: ages.text,
                                vaccin: vaccin.text,
                                technic: technique.text,
                                injectrionPlace: injectionSite.text,
                                birthDate: birthDate.text,
                                lotNumber: lotnumber.text));
                            _viewcontroller.update();
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            width: 30.r,
                            height: 30.r,
                            child: Image.asset("assets/icons/right.png"),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
