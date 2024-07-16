import 'package:flutter/material.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/view/message/registrationPhoneNumber/component/RegistrationPhoneNumberPage2Widget.dart';

class RegistrationPhoneNumberPage3 extends StatelessWidget {
  const RegistrationPhoneNumberPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.1.h),
            child: PriviousAppbar(),
          ),
        ),
        body: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 3.3.h,
                  ),
                  Text(
                    '마카롱님에게\n메세지를 보낼까요?',
                    style: TextStyle(
                      color: Color(0xFF171B1C),
                      fontSize: 20.3.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 1.4.h,
                  ),
                  Text(
                    '메시지를 보낸 후 상대방이 3일 동안 보지 않으면\n루비를 돌려드려요.',
                    style: TextStyle(
                      color: Color(0xFF5A6166),
                      fontSize: 16.3.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 4.3.h,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(bottom: 1.2.h),
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F2F4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      textAlign: TextAlign.start,
                      maxLength: 500,
                      maxLines: null,
                      decoration: InputDecoration(
                        suffixText: "/ 40",
                        suffixStyle: TextStyle(
                          color: Color(0xFF00C57D),
                          fontSize: 14.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                        hintText: '내용을 입력하세요.',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            top: 1.4.h, left: 4.w, right: 4.w, bottom: 20.2.h),
                      ),
                      style: TextStyle(
                        color: Color(0xFF5A6166),
                        fontSize: 16.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
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
