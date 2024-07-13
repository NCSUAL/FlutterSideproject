import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/bloc/MyProfilesBloc.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_project/view/loading/Loading.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({super.key});

  @override
  State<ProfileMain> createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  //스위치 나중에 상태관리 할 예정
  bool _switchValue = true;

  Widget _component(String text) {
    return Container(
      width: double.infinity,
      height: 8.h,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.1.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${text}',
              style: TextStyle(
                color: Color(0xFF1E2427),
                fontSize: 17.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 23.sp,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget component2(String text) {
    return Container(
      width: double.infinity,
      height: 7.1.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.1.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${text}',
              style: TextStyle(
                color: Color(0xFF1E2427),
                fontSize: 17.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 23.sp,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentState = context.watch<MyProfilesBloc>().state;
    if (currentState is LoadedMyProfileState) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffF2F3F4),
          body: ScrollConfiguration(
            behavior: const ScrollBehavior()
                .copyWith(overscroll: false), // 담김 효과 제거 overscroll
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //공간
                  SizedBox(
                    height: 2.h,
                  ),
                  //공간
                  CircleAvatar(
                    radius: 7.4.h,
                    backgroundImage: NetworkImage(currentState
                        .data!.images[0].image), // 이미지 URL을 자신의 것으로 변경
                  ),
                  SizedBox(height: 2.3.h),
                  Text(
                    currentState.data!.nickname,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19.4.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 1.2.h),
                  GestureDetector(
                      onTap: () {
                        //프로필 수정 함수
                      },
                      child: Component(null, 0, '프로필 수정', 31, 4.6, 16.2.sp)),
                  SizedBox(height: 3.4.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            //연애 시뮬레이션 결과 함수
                          },
                          child: Container(
                            width: double.infinity,
                            height: 8.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.1.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '연애 시뮬레이션 결과',
                                    style: TextStyle(
                                      color: Color(0xFF1E2427),
                                      fontSize: 17.sp,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    size: 23.sp,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 0.1,
                        ),
                        GestureDetector(
                          onTap: () {
                            //지인 차단하기 함수
                          },
                          child: _component('지인 차단하기'),
                        ),
                        Divider(height: 0.1),
                        GestureDetector(
                            onTap: () {
                              //차단 관리 함수
                            },
                            child: _component('차단 관리')),
                        Divider(height: 0.1),
                        GestureDetector(
                          onTap: () {
                            //알림 설정 함수
                          },
                          child: _component('알림 설정'),
                        ),
                        Divider(height: 0.1),
                        GestureDetector(
                            onTap: () {
                              //고객센터 함수
                            },
                            child: _component('고객센터')),
                        Divider(height: 0.1),
                        GestureDetector(
                          onTap: () {
                            //이용약관 함수
                          },
                          child: Container(
                            width: double.infinity,
                            height: 8.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.1.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '이용약관',
                                    style: TextStyle(
                                      color: Color(0xFF1E2427),
                                      fontSize: 17.sp,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    size: 23.sp,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.2.h),

                        //일시휴식
                        Container(
                          width: double.infinity,
                          height: 11.5.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.1.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '일시휴식',
                                      style: TextStyle(
                                        color: Color(0xFF1E2427),
                                        fontSize: 17.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.2.h,
                                    ),
                                    Text(
                                      '신규 매칭에 제외되며 내 프로필이\n공개되지 않아요.',
                                      style: TextStyle(
                                        color: Color(0xFF999FA4),
                                        fontSize: 15.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                                Transform.scale(
                                  scale: 0.85,
                                  child: CupertinoSwitch(
                                    value: _switchValue,
                                    onChanged: (value) {
                                      setState(() {
                                        _switchValue = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 2.2.h),
                        //로그아웃
                        GestureDetector(
                            onTap: () {
                              //로그아웃 함수
                            },
                            child: component2('로그아웃')),

                        SizedBox(height: 2.2.h),
                        //탈퇴하기
                        GestureDetector(
                            onTap: () {
                              //로그아웃 함수
                            },
                            child: component2('탈퇴하기')),
                        SizedBox(height: 2.2.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Loading();
    }
  }
}
