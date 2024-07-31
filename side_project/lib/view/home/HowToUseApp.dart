import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:get/get.dart';
import 'package:side_project/view/home/designcomponent/DesignComponent_HowToUseApp.dart';

class HowToUseApp extends StatelessWidget {
  const HowToUseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.4.w),
          child: Column(
            children: [
              SizedBox(
                height: 1.h,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  child: Container(
                    width: 7.w,
                    child: Image_Res('delete', 1),
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
              SizedBox(
                height: 2.6.h,
              ),
              Text(
                '반,하다 이용방법',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 4.2.h,
              ),
              DesignComponent_HowToUseApp(),
            ],
          ),
        ),
      ),
    );
  }
}
