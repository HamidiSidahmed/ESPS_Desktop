import 'package:epsp/view/homePage.dart';
import 'package:epsp/view/introPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();

  runApp(ScreenUtilInit(
    designSize: Size(1920, 1080),
    builder: (context, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
      );
    },
    child: HomePage(),
  ));
}
