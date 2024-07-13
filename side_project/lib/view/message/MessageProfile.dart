import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/bloc/MyProfilesBloc.dart';
import 'package:side_project/bloc/ReceivedMessageBloc.dart';
import 'package:side_project/dto/MessageUpdateDto.dart';
import 'package:side_project/model/MessageModel.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:get/get.dart' as getx;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_project/view/message/registrationPhoneNumber/RegistrationPhoneNumberPage1.dart';

class MessageProfile extends StatelessWidget {
  const MessageProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MessageModel data = getx.Get.arguments;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(7.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.8.w, vertical: 1.1.h),
              child: PriviousAppbar(),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 4.5.h,
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-vector/vector-damask-seamless-pattern-background-classical-luxury-old-fashioned-damask-ornament-royal-victorian-seamless-texture-wallpapers-textile-wrapping-exquisite-floral-baroque-template_1217-738.jpg?t=st=1719395015~exp=1719398615~hmac=6cb577d0b8b05885cafb1323e0efd98ee7d3edcd2ba584287ab5f1f982be89b6&w=740'), // 프로필 이미지 URL
                    ),
                    SizedBox(width: 4.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          '${data.sender_name}님의 메시지',
                          style: TextStyle(
                            color: Color(0xFF171B1C),
                            fontSize: 18.5.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            // 상세 프로필 보기 이벤트
                          },
                          child: Text(
                            '상세 프로필 보기 >',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF74D495),
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF08D88F),
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Container(
                  padding: EdgeInsets.only(
                      left: 4.w, right: 4.w, top: 2.3.h, bottom: 2.7.h),
                  decoration: ShapeDecoration(
                    color: Color(0xFFF1F2F4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '메시지 내용',
                        style: TextStyle(
                          color: Color(0xFF2E363A),
                          fontSize: 17.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        height: 0.7.h,
                      ),
                      Container(
                        height: 38.h,
                        width: double.infinity,
                        child: ScrollConfiguration(
                          behavior: const ScrollBehavior().copyWith(
                              overscroll: false), // 담김 효과 제거 overscroll
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical, //.horizontal
                            child: Text(
                              data.content.toString(),
                              style: TextStyle(
                                color: Color(0xFF5A6166),
                                fontSize: 16.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 6.9.h,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () {
                          // 내 연락처 등록하기 이벤트
                        },
                        child: BlocBuilder<MyProfilesBloc, MyProfileState>(
                            builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              if (state.phone_number) {
                                //수락하기
                              } else {
                                //내 연락처 등록하기
                                getx.Get.to(
                                    () => RegistrationPhoneNumberPage1(),
                                    transition: getx.Transition.noTransition);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF74D495),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 2.1.h),
                              alignment: Alignment.center,
                              child: Text(
                                state.phone_number ? '수락하기' : '내 연락처 등록하기',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 1.4.h),
                    SizedBox(
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () {
                          // 거절하기 이벤트
                          final MessageUpdateDto _messageUpdateDto =
                              new MessageUpdateDto(
                                  id: data.id!,
                                  status: data.status!,
                                  content: data.content!);
                          context.read<ReceivedMessageBloc>().add(
                              ReceivedMessagedRefuseEvent(_messageUpdateDto));

                          getx.Get.back();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFC1FFDD),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 2.1.h),
                          alignment: Alignment.center,
                          child: Text(
                            '거절하기',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF68C284),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
