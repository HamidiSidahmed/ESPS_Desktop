import 'package:epsp/controller/viewController.dart';
import 'package:epsp/model/model.dart';
import 'package:epsp/model/vaccin.dart';
import 'package:epsp/utils/addedData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseController extends GetxController {
  var list = <Map<String, dynamic>>[].obs;
  List vaccinList = [];
  static String filter = "";
  static late Database database;
  static List deletedList = [];
  bool adding = true;
  int idToUpadte = 0;
  RxBool allChecked = false.obs;
  @override
  void onInit() async {
    await openMyDatabase();
    bool isEmpty = await isTableEmpty(database, "PERSONS");
    if (isEmpty)
      print("table is empty");
    else {
      await getData();
      print(list.length);
      for (var element in list) {
        ViewController.checkedList.add(false.obs);
      }
    }
  }

  Future<bool> isTableEmpty(Database db, String tableName) async {
    final result = await db.rawQuery('SELECT COUNT(*) FROM $tableName');
    int count = Sqflite.firstIntValue(result) ?? 0;
    return count == 0;
  }

  Future openMyDatabase() async {
    print(await getDatabasesPath());
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'my_database.db');
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        db.execute(
            "CREATE TABLE PERSONS (id INTEGER PRIMARY KEY,name TEXT, birthDate TEXT, birthPlace TEXT,father TEXT,mother TEXT,state TEXT,sex TEXT)");
        db.execute(
            "CREATE TABLE VACCINS (id TEXT PRIMARY KEY,age TEXT, vaccin TEXT, technic TEXT,place TEXT,date TEXT,lot TEXT,personid INTEGER)");
      },
    );
  }

  Future inseteData(
    Model model,
  ) async {
    await database.insert(
      "PERSONS",
      model.toMap(),
    );
    ViewController.checkedList.add(RxBool(false));
  }

  Future insertVaccin(List<VaccinModel> listVaccin) async {
    for (var element in listVaccin) {
      await database.insert(
        "VACCINS",
        element.toMap(),
      );
    }
  }

  Future getData() async {
    if (filter == "") {
      list.value = await database.query(
        "PERSONS",
        orderBy: "name",
      );
    } else {
      list.value = await database.query(
        "PERSONS",
        orderBy: "name",
      );
      list.value = list
          .where(
            (element) =>
                element["name"].toString().toLowerCase().contains(filter),
          )
          .toList();
    }
  }

  Future deleteData(int id) async {
    await database.delete("PERSONS", where: 'id = ?', whereArgs: [id]);
    await database.delete("VACCINS", where: 'personid = ?', whereArgs: [id]);
    getData();
    
  }

  Future<List<AddedData>> getVaccinData(
    int id,
  ) async {
    List<AddedData> vaccin;
    List list =
        await database.query("VACCINS", where: 'personid = ?', whereArgs: [id]);
    vaccin = List.generate(
      list.length,
      (index) {
        return AddedData(
            id: list[index]["personid"],
            data: [],
            age: list[index]["age"],
            vaccin: list[index]["vaccin"],
            technic: list[index]["technic"],
            injectrionPlace: list[index]["place"],
            birthDate: list[index]["date"],
            lotNumber: list[index]["lot"]);
      },
    );
    return vaccin;
  }

  Future updatePerson(
    int id,
    Model model,
  ) async {
    await database
        .update("PERSONS", model.toMap(), where: 'id = ?', whereArgs: [id]);
  }

  Future updateVaccin(int id, List<VaccinModel> listVaccin) async {
    for (var element in listVaccin) {
      await database.update("VACCINS", element.toMap(),
          where: 'personid = ?', whereArgs: [id]);
    }
    update();
  }

  void filterSearchResults(String query, List<Map<String, dynamic>> items) {
    if (query.isEmpty) {
      getData();
    } else {
      list.value = items
          .where((item) =>
              item["name"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    update();
  }
}
