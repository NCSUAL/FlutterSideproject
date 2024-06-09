import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/reponsive_layout/Responsive.dart';
class MessageAppbar extends StatelessWidget {
  final String? image;
  final String text;
  const MessageAppbar({super.key,required this.text,this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 1.h,left: 2.9.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           Text(this.text,style: TextStyle(fontFamily: "Pretendard",fontWeight: FontWeight.w800,fontSize: 19.5.sp),),
            SizedBox(width: 1.w,),

            if(this.image!= null)...[
              Container(width: 3.4.h,child: Image_Res(this.image??"", 1))
            ]

          ],
        ),
      ),
    );
  }
}
