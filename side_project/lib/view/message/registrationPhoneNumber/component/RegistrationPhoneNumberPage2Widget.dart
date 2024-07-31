import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart' as getx;
import 'package:side_project/view/message/registrationPhoneNumber/RegistrationPhoneNumberPage3.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';

class RegistrationPhoneNumberPage2Widget extends StatefulWidget {
  const RegistrationPhoneNumberPage2Widget({super.key});

  @override
  State<RegistrationPhoneNumberPage2Widget> createState() =>
      _RegistrationPhoneNumberPage2WidgetState();
}

class _RegistrationPhoneNumberPage2WidgetState
    extends State<RegistrationPhoneNumberPage2Widget> {
  List<TextEditingController> _controller =
      List.generate(3, (index) => new TextEditingController());
  List<bool> _isinpt = List.generate(3, (index) => false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int a = 0; a < _controller.length; a++) {
      _controller[a].addListener(() {
        setState(() {
          _isinpt[a] = _controller[a].text.isNotEmpty;
        });
      });
    }
  }

  bool check() {
    for (bool a in _isinpt) {
      if (!a) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        form('전화번호', 0, _controller),
        SizedBox(
          height: 2.7.h,
        ),
        form('카카오톡', 1, _controller),
        SizedBox(
          height: 2.7.h,
        ),
        form('인스타ID', 2, _controller),
        SizedBox(
          height: 7.5.h,
        ),
        GestureDetector(
          onTap: () {
            if (check()) {
              getx.Get.off(() => RegistrationPhoneNumberPage3(),
                  transition: getx.Transition.noTransition);
            }
          },
          child: Container(
            width: double.infinity,
            height: 7.h,
            decoration: ShapeDecoration(
              color: check() ? Color(0xFF02D289) : Color(0xFF999FA4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                '등록하기',
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
    );
  }
}
