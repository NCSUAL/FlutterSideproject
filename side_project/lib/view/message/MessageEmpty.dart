import 'package:flutter/material.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class MessageEmpty extends StatelessWidget {
  const MessageEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(

          children: [

            //간격
            SizedBox(height: 15.h,),
            //간격

            SizedBox(child: Image_Res("message_3", 1),width: 22.w),

            SizedBox(height: 4.8.h,),
            Text(
              '아직 메시지가 없어요',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF41474C),
                fontSize: 17.8.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),

            SizedBox(height: 2.8.h,),
            Text(
              '나에게 호감을 보낸 상대를\n먼저 확인해볼까요?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF41474C),
                fontSize: 17.7.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),

            SizedBox(height: 6.5.h,),



            //상태관리
            InkWell(
                child: Component("받은 호감 확인하기", 49, 5.5,16.8),

            ),



          ],
        ),
    );
  }
}
