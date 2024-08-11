import 'package:epsp/controller/dataBase.dart';
import 'package:epsp/view/homePage.dart';
import 'package:epsp/view/introPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:window_manager/window_manager.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:get/get.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  // Set the factory
  databaseFactory = databaseFactoryFfi;
  
  runApp(ScreenUtilInit(
    designSize: Size(1920, 1080),
    builder: (context, child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
      );
    },
    child: HomePage(),
  ));
}
