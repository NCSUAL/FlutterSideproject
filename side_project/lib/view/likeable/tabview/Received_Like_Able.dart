import 'package:flutter/material.dart';
import 'package:side_project/reponsive_layout/NoGlowScrollBehavior.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
class Recieved_Like_Able extends StatefulWidget {
  const Recieved_Like_Able({super.key});

  @override
  State<Recieved_Like_Able> createState() => _Recieved_Like_AbleState();
}

class _Recieved_Like_AbleState extends State<Recieved_Like_Able> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F3F4),

        body: ScrollConfiguration(
          behavior: NoGlowScrollBehavior(), //담김 효과 제거,
          child: Column(

          children: [
            SizedBox(height: 3.5.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Component("서로 좋아해요",28,4,15)
              ],
            ),


            //리스트


          ],
          ),

        ),
    );
  }

}
