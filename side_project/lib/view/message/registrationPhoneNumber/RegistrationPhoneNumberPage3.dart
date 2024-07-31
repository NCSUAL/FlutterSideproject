import 'package:flutter/material.dart';
import 'package:side_project/bloc/OtherProfilesBloc.dart';
import 'package:side_project/cubit/MessageProfileCubit.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/view/message/registrationPhoneNumber/component/RegistrationPhoneNumberPage3WidgetState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPhoneNumberPage3 extends StatelessWidget {
  const RegistrationPhoneNumberPage3({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.1.h),
            child: PriviousAppbar(),
          ),
        ),
        body: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 3.3.h,
                  ),
                  BlocBuilder<MessageProfileCubit, MessageProfileState>(
                      builder: (context, state) {
                    return Text(
                      '${(state.messageModel == null) ? state.profileModel!.nickname : state.messageModel!.sender_name}님에게\n메세지를 보낼까요?',
                      style: TextStyle(
                        color: Color(0xFF171B1C),
                        fontSize: 20.3.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    );
                  }),
                  SizedBox(
                    height: 1.4.h,
                  ),
                  Text(
                    '메시지를 보낸 후 상대방이 3일 동안 보지 않으면\n루비를 돌려드려요.',
                    style: TextStyle(
                      color: Color(0xFF5A6166),
                      fontSize: 16.3.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 4.3.h,
                  ),
                  RegistrationPhoneNumberPage3Widget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
