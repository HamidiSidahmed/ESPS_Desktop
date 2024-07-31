import 'package:epsp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 750.r,
              width: 750.r,
              child: Image.asset(
                "assets/image/logo.png",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 500.r,
                  child: Text(
                    "EPSP DE TENES",
                    style: TextStyle(
                        color: Colors.white, fontSize: 62, letterSpacing: 10),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.r),
                  child: Text(
                    "  Vote santé , Notre priorité",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontSize: 22.sp),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
