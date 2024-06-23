import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


//반응형 이미지
Widget Image_Res(String image,double width){
  return LayoutBuilder(builder: (context, constraints) {
      return Image.asset(fit: BoxFit.cover,width: constraints.maxWidth*width,
          "assets/image/${image}.png");
  },);
}

//반응형 컴포넌트
Widget Component(String text,double width,double height,double fontsize){
  return Container(

    width: width.w,
    height: height.h,

    clipBehavior: Clip.antiAlias,
    decoration: ShapeDecoration(
      color: Color(0xFF74D495),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontsize.sp,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ],
    ),
  );
}