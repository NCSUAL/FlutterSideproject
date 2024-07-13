import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:get/get.dart';

class ProfileAppbar extends StatelessWidget {
  final String text;
  const ProfileAppbar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Container(
              width: 2.5.w,
              child: Image_Res('privious', 1),
            ),
            onTap: () {
              Get.back();
            },
          ),
          Center(
            child: Text(
              '${text}의 프로필',
              style: TextStyle(
                color: Color(0xFF2E363A),
                fontSize: 17.3.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              width: 6.w,
              child: Image_Res('attention', 1),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
