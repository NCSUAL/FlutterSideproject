import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:side_project/view/home/DailyFourIntroduce.dart';
import 'package:get/get.dart' as getx;
import 'package:side_project/view/home/HowToUseApp.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(
            left: 5.6.w,
            right: 5.6.w,
          ),
          child: Column(
            children: [
              //간격
              SizedBox(
                height: 1.3.h,
              ),
              //간격

              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //이용 방법 버튼
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          barrierColor: Colors.black54,
                          context: context,
                          builder: (BuildContext context) {
                            return HowToUseApp();
                          },
                        );
                      },
                      child: Row(
                        children: [
                          SizedBox(width: 7.2.w, child: Image_Res("point", 1)),
                          SizedBox(
                            width: 0.75.w,
                          ),
                          Text(
                            '이용방법',
                            style: TextStyle(
                              color: Color(0xFF5A6166),
                              fontSize: 15.5.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    //이용 방법 버튼

                    /**
                    Row(
                      children: [
                        //하트버튼
                        InkWell(
                          child: SizedBox(
                              width: 7.2.w, child: Image_Res("ruby", 1)),
                        ),
                        //하트버튼

                        SizedBox(
                          width: 1.5.w,
                        ),

                        //설정 버튼
                        InkWell(
                          child: SizedBox(
                              width: 7.2.w, child: Image_Res("filter", 1)),
                        ),
                        //설정 버튼
                      ],
                    ),
                    */
                  ],
                ),
              ),

              SizedBox(
                height: 4.h,
              ),

              Text(
                '오늘의 반쪽',
                style: TextStyle(
                  color: Color(0xFF171B1C),
                  fontSize: 21.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),

              SizedBox(
                height: 0.8.h,
              ),
              Text(
                '하루에 네 번 소개해드려요',
                style: TextStyle(
                  color: Color(0xFF5A6166),
                  fontSize: 16.3.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 4.5.h,
              ),
              Expanded(child: DailyFourIntroduce()),
            ],
          ),
        ),
      ),
    );
  }
}
