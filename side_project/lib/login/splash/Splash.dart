import 'package:flutter/material.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 32.w,
              child: Image_Res("logo", 1),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
