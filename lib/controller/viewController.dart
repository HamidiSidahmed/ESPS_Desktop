

import 'package:epsp/controller/dataBase.dart';
import 'package:epsp/utils/addedData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewController extends GetxController {
  RxBool checked = false.obs;

  List<AddedData> list = <AddedData>[];
  Future initList(Future<List<AddedData>> list) async {
    this.list = await list;
    update();
  }

  DataBaseController controller = Get.find();
  RxBool allChecked = false.obs;
 static var checkedList = <RxBool>[].obs;
  
}
