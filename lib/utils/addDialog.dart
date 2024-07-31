import 'package:epsp/utils/addedData.dart';
import 'package:epsp/utils/textFieldD.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DIalogPage extends StatefulWidget {
  DIalogPage({super.key});

  @override
  State<DIalogPage> createState() => _DIalogPageState();
}

class _DIalogPageState extends State<DIalogPage> {
  static List<AddedData> data = [];

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

  String age = "A la naissance";
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
  @override
  void dispose() {
      data.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1700.r,
      height: 950.r,
      padding: EdgeInsets.only(top: 40.r, left: 0.r),
      color: Colors.white,
      child: Column(children: [
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
                        value == null ? value = DateTime.now() : value = value;
                        birthDate.text = DateFormat("dd/MM/yyyy").format(value);
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
                                fontSize: 15.sp, fontWeight: FontWeight.w500)),
                        value: "Garcon",
                      ),
                      PopupMenuItem(
                        child: Text("Fille",
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w500)),
                        value: "Fille",
                      )
                    ];
                  },
                ),
              )
            ],
          ),
        ),
        Column(
          children: data,
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
                    setState(() {
                      age = value;
                    });
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
                    if (age == "A la naissance") {
                      return naissance;
                    } else if (age == "2 mois" ||
                        age == "4 mois" ||
                        age == "12 mois")
                      return twoMonthVaccin;
                    else if (age == "11 mois" || age == "18 mois") {
                      return [
                        PopupMenuItem(
                            value: "ROR",
                            child: Text(
                              "ROR",
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
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
                title: "Date de naissance",
                widget: InkWell(
                  onTap: () {
                    showDatePicker(
                            context: context,
                            firstDate: DateTime(2002),
                            lastDate: DateTime(2025))
                        .then(
                      (value) {
                        value == null ? value = DateTime.now() : value = value;
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
                        print(UniqueKey());
                        setState(() {
                          data.add(AddedData(
                            last: InkWell(
                              onTap: () {
                                setState(() {
                                  data.removeAt(0);
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 0),
                                width: 30.r,
                                height: 30.r,
                                child: Image.asset("assets/icons/faux.png"),
                              ),
                            ),
                            data: data,
                            age: ages.text,
                            vaccin: vaccin.text,
                            technic: technique.text,
                            injectrionPlace: injectionSite.text,
                            birthDate: date.text,
                            lotNumber: lotnumber.text,
                            key: UniqueKey(),
                          ));
                        });

                        print(data.length);
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
        )
      ]),
    );
  }
}
