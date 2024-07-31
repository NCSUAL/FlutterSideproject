import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

//반응형 이미지
Widget Image_Res(String image, double width) {
  return LayoutBuilder(
    builder: (context, constraints) {
      return Image.asset(
          fit: BoxFit.cover,
          width: constraints.maxWidth * width,
          "assets/image/${image}.png");
    },
  );
}

//반응형 컴포넌트
Widget Component(String? image, double imageweight, String text, double width,
    double height, double fontsize) {
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
        if (image != null) ...[
          Container(
            width: imageweight.w,
            child: Image_Res(image, 1),
          ),
          SizedBox(
            width: 1.8.w,
          ),
        ],
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

//돌아가기 앱바

class PriviousAppbar extends StatelessWidget {
  final String? text;
  const PriviousAppbar({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          GestureDetector(
            child: Container(
              width: 2.7.w,
              child: Image_Res('privious', 1),
            ),
            onTap: () {
              Get.back();
            },
          ),
          if (text != null) ...[
            Center(
              child: Text(
                text!,
                style: TextStyle(
                  color: Color(0xFF2E363A),
                  fontSize: 17.3.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ],
      ),
    );
  }
}

//호감 컴포넌트(서로 좋아해요)
Widget likeAbleComponent1(
    String url, String text, String subtitle, String likeEachOther) {
  return Container(
    width: 20.w,
    height: 27.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 0.5,
          blurRadius: 5,
          offset: Offset(0, 3), // 그림자의 위치 조정
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        text,
        fit: BoxFit.fill,
      ),
    ),
  );
}

//호감 컴포넌트(반지를 보냄)
Widget likeAbleComponent2(String url, String text, String subtitle) {
  return Column(
    children: [
      Container(
        width: 42.5.w,
        height: 23.6.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 5,
              offset: Offset(0, 3), // 그림자의 위치 조정
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            url,
            fit: BoxFit.fill,
          ),
        ),
      ),
      SizedBox(
        height: 1.4.h,
      ),
      Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF171B1C),
          fontSize: 16.7.sp,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w600,
          height: 0,
        ),
      ),
      SizedBox(
        height: 0.4.h,
      ),
      Text(
        subtitle,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF5A6166),
          fontSize: 15.2.sp,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
      ),
      SizedBox(
        height: 3.4.h,
      ),
    ],
  );
}

//연락처 등록 폼
Widget form(String text, int index, List<TextEditingController> _controller) {
  return Container(
    width: double.infinity,
    child: Row(
      children: [
        Text(
          text,
          style: TextStyle(
            color: Color(0xFF41474C),
            fontSize: 17.sp,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
        Expanded(
          child: TextField(
            cursorColor: Colors.black,
            controller: _controller[index],
            textAlign: TextAlign.start,
            style: TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 17.3.sp,
                color: Colors.black,
                height: 1),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.34.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color(0xFF41474C),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color(0xFFC5C8CE),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color(0xFFC5C8CE),
                  width: 1,
                ),
              ),
              hintText: 'abc1234',
              fillColor: Color(0xFFFDFDFD),
              hintStyle: TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 17.3.sp,
                color: Color(0xFF999FA4),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
