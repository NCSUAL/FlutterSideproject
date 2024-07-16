import 'package:flutter/material.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/view/message/registrationPhoneNumber/component/RegistrationPhoneNumberPage2Widget.dart';

class RegistrationPhoneNumberPage2 extends StatelessWidget {
  const RegistrationPhoneNumberPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.8.w, vertical: 1.1.h),
            child: PriviousAppbar(),
          ),
        ),
        body: SingleChildScrollView(
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.4.h,
                  ),
                  Text(
                    '연락처 등록하기',
                    style: TextStyle(
                      color: Color(0xFF171B1C),
                      fontSize: 21.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 1.6.h,
                  ),
                  Text(
                    '해당 연락처는 지인차단 및 번호 교환시에만 사용해요.\n(최소 1개 이상의 연락처를 등록해야 해요.)',
                    style: TextStyle(
                      color: Color(0xFF5A6166),
                      fontSize: 16.3.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 5.3.h,
                  ),
                  RegistrationPhoneNumberPage2Widget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
