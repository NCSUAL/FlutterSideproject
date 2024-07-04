import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailsProfile extends StatelessWidget {
  const DetailsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF2F3F4),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 20.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://img.freepik.com/free-vector/vector-damask-seamless-pattern-background-classical-luxury-old-fashioned-damask-ornament-royal-victorian-seamless-texture-wallpapers-textile-wrapping-exquisite-floral-baroque-template_1217-738.jpg?t=st=1719395015~exp=1719398615~hmac=6cb577d0b8b05885cafb1323e0efd98ee7d3edcd2ba584287ab5f1f982be89b6&w=740',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 3.w),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '서로 반지를 보냈어요',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '마카롱님의 프로필',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19.4.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 3.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '나와의 관계',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  '긴장',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 3.w),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              '연애 스타일 보러가기 >',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 3.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '프로필',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_up,
                                  color: Colors.black),
                            ],
                          ),
                        ),
                        SizedBox(height: 1.h),
                      ],
                    ),
                  ),
                ],
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
