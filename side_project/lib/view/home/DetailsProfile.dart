import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/bloc/OtherProfilesBloc.dart';
import 'package:side_project/cubit/MessageProfileCubit.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:side_project/test/Image.dart';
import 'package:side_project/view/home/ProfileAppbar/ProfileAppbar.dart';
import 'package:side_project/view/home/designcomponent/DesignComponent_DetailsProfile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_project/view/loading/Loading.dart';
import 'package:get/get.dart' as getx;
import 'package:side_project/view/message/MessageProfile.dart';
import 'package:side_project/view/message/registrationPhoneNumber/RegistrationPhoneNumberPage1.dart';

class DetailsProfile extends StatelessWidget {
  const DetailsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final state = context.watch<OtherProfilesBloc>().state;

    if (state is LoadedOtherProfilesState) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffF2F3F4),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(5.h),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 7.6.w, vertical: 1.1.h),
                child: ProfileAppbar(
                  text: state.data!.nickname,
                ),
              ),
            ),
          ),
          body: Stack(
            children: [
              ScrollConfiguration(
                behavior: const ScrollBehavior()
                    .copyWith(overscroll: false), // 담김 효과 제거 overscroll
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
                                image: NetworkImage(ImageTest.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          //서로 호감일시 UI
                          /**
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
                           */
                        ],
                      ),
                      SizedBox(height: 3.5.h),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        '준비중',
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
                            DesignComponent_DetailsProfile(
                              data: state.data!,
                            ),
                            SizedBox(
                              height: 50.h,
                            )
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
                  padding:
                      EdgeInsets.only(left: 6.w, right: 6.w, bottom: 1.7.h),
                  child: Container(
                    height: 8.4.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(36),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                child: Image_Res('heart_ch', 1),
                                width: 8.w,
                              ),
                              SizedBox(
                                height: 0.3.h,
                              ),
                              Text(
                                '하트',
                                style: TextStyle(
                                  color: Color(0xFF00C57D),
                                  fontSize: 14.5.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                child: Image_Res('ring_change', 1),
                                width: 8.w,
                              ),
                              SizedBox(
                                height: 0.3.h,
                              ),
                              Text(
                                '반지',
                                style: TextStyle(
                                  color: Color(0xFF00C57D),
                                  fontSize: 14.5.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<MessageProfileCubit>()
                                  .updateState_Pr(state!.data!);
                              //내 연락처 등록하기
                              getx.Get.to(() => RegistrationPhoneNumberPage1(),
                                  transition: getx.Transition.noTransition);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  child: Image_Res('chat_change', 1),
                                  width: 8.w,
                                ),
                                SizedBox(
                                  height: 0.3.h,
                                ),
                                Text(
                                  '메세지',
                                  style: TextStyle(
                                    color: Color(0xFF00C57D),
                                    fontSize: 14.5.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w, bottom: 12.h),
                  child: GestureDetector(
                    onTap: () {
                      //위로 가기
                      scrollController.animateTo(
                        0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: OvalBorder(),
                          shadows: [
                            BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 10,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.sp),
                          child: SizedBox(
                            width: 6.4.w,
                            child: Image_Res('arrow', 1),
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return SafeArea(
          child: Scaffold(
        backgroundColor: Color(0xffF2F3F4),
        body: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), child: Loading()),
      ));
    }
  }
}
