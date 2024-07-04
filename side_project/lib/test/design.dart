import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:side_project/test/plusProfile.dart';
import 'package:side_project/view/home/ProfileAppbar/ProfileAppbar.dart';

class Design extends StatelessWidget {
  const Design({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF2F3F4),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.6.w, vertical: 1.1.h),
              child: ProfileAppbar(),
            ),
          ),
        ),
        body: Stack(
          children: [
            ScrollConfiguration(
              behavior: const ScrollBehavior(), //담김제거
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 49.6.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://mblogthumb-phinf.pstatic.net/MjAyMDA5MDNfMjk0/MDAxNTk5MTI1ODQzMTAy.vvvvkfj2ujzZx1TXfyHk6lcXsyWuptP1OcRUXfUnYUcg.tUDit1T4ppM07McaG4-8g1Uc3TRSOeQwGhQ79bRtjqkg.PNG.shshspdla/16%EB%8C%8010.png?type=w800',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.8.h),
                          child: Container(
                            width: 46.w,
                            height: 3.8.h,
                            decoration: ShapeDecoration(
                                color: Colors.black
                                    .withOpacity(0.6000000238418579),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 3.3.w,
                                  child: Image_Res('ring', 1),
                                ),
                                SizedBox(
                                  width: 1.3.w,
                                ),
                                Text(
                                  '서로 반지를 보냈어요',
                                  style: TextStyle(
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.8.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            width: double.infinity,
                            height: 6.7.h,
                            decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '나와의 관계',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.7.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 0.3.w,
                                    ),
                                    Container(
                                      width: 5.7.w,
                                      child: Image_Res('point', 1),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 16.w,
                                  height: 3.5.h,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFFFB700),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.33),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '긴장',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17.78.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Container(
                            width: double.infinity,
                            height: 7.h,
                            decoration: ShapeDecoration(
                              color: Color(0xFF74D495),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '연애 스타일 보러가기 >',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.5.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 1.8.h),
                          DesignComponent1(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(2.h),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.favorite,
                              color: Colors.green, size: 24.sp),
                          SizedBox(height: 1.h),
                          Text(
                            '하트',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.circle, color: Colors.grey, size: 24.sp),
                          SizedBox(height: 1.h),
                          Text(
                            '반지',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.message, color: Colors.green, size: 24.sp),
                          SizedBox(height: 1.h),
                          Text(
                            '메세지',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10.h,
              right: 2.h,
              child: FloatingActionButton(
                onPressed: () {
                  scrollController.animateTo(
                    0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Icon(Icons.keyboard_arrow_up),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
