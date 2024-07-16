import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart' as getx;
import 'package:side_project/view/message/registrationPhoneNumber/RegistrationPhoneNumberPage2.dart';

class RegistrationPhoneNumberPage1 extends StatefulWidget {
  const RegistrationPhoneNumberPage1({super.key});

  @override
  State<RegistrationPhoneNumberPage1> createState() =>
      _RegistrationPhoneNumberPage1State();
}

class _RegistrationPhoneNumberPage1State
    extends State<RegistrationPhoneNumberPage1> {
  TextEditingController controller = new TextEditingController(text: '');
  bool _isinpt = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        _isinpt = controller.text.isNotEmpty;
      });
    });
  }

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
            child: PriviousAppbar(
              text: '카카오톡 등록',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.8.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 3.9.h,
                  ),
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      '카카오톡 ID 입력하기',
                      style: TextStyle(
                        color: Color(0xFF171B1C),
                        fontSize: 19.6.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.6.h,
                  ),
                  TextField(
                    onTapOutside: (event) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    cursorColor: Colors.black,
                    controller: controller,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 17.3.sp,
                        color: Colors.black,
                        height: 1),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 2.5.h),
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
                          color: Color(0xFF41474C),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xFF41474C),
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
                  SizedBox(
                    height: 3.9.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      getx.Get.to(() => RegistrationPhoneNumberPage2(),
                          transition: getx.Transition.noTransition);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 7.h,
                      decoration: ShapeDecoration(
                        color: _isinpt ? Color(0xFF02D289) : Color(0xFF999FA4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '저장하기',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
