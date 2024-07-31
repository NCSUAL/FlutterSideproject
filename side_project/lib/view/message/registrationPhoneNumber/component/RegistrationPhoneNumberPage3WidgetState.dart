import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart' as getx;
import 'package:side_project/bloc/MyProfilesBloc.dart';
import 'package:side_project/bloc/SentMessageBloc.dart';
import 'package:side_project/cubit/MessageProfileCubit.dart';
import 'package:side_project/view/message/registrationPhoneNumber/RegistrationPhoneNumberPage3.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_project/dto/MessageSentDto.dart';

class RegistrationPhoneNumberPage3Widget extends StatefulWidget {
  const RegistrationPhoneNumberPage3Widget({super.key});

  @override
  State<RegistrationPhoneNumberPage3Widget> createState() =>
      _RegistrationPhoneNumberPage3WidgetState();
}

class _RegistrationPhoneNumberPage3WidgetState
    extends State<RegistrationPhoneNumberPage3Widget> {
  List<TextEditingController> _controller =
      List.generate(4, (index) => new TextEditingController());
  List<bool> _isinpt = List.generate(4, (index) => false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int a = 0; a < _controller.length; a++) {
      _controller[a].addListener(() {
        setState(() {
          _isinpt[a] = _controller[a].text.isNotEmpty;
        });
      });
    }
  }

  bool check() {
    for (bool a in _isinpt) {
      if (!a) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 28.5.h,
          width: double.infinity,
          padding: EdgeInsets.only(bottom: 1.5.h),
          decoration: BoxDecoration(
            color: Color(0xFFF1F2F4),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: _controller[3],
            textAlign: TextAlign.start,
            maxLength: 500,
            maxLines: null,
            expands: true,
            decoration: InputDecoration(
              hintText: '내용을 입력하세요.',
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(top: 1.4.h, left: 4.w, right: 4.w),
            ),
            style: TextStyle(
              color: Color(0xFF5A6166),
              fontSize: 16.sp,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: 4.4.h,
        ),
        Text(
          '연락처 공유',
          style: TextStyle(
            color: Color(0xFF171B1C),
            fontSize: 18.5.sp,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        SizedBox(
          height: 0.8.h,
        ),
        Text(
          '최소 1개 이상의 연락처를 등록해주세요.',
          style: TextStyle(
            color: Color(0xFF999FA4),
            fontSize: 16,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        form('전화번호', 0, _controller),
        SizedBox(
          height: 2.7.h,
        ),
        form('카카오톡', 1, _controller),
        SizedBox(
          height: 2.7.h,
        ),
        form('인스타ID', 2, _controller),
        SizedBox(
          height: 7.5.h,
        ),
        GestureDetector(
          onTap: () {
            //내용,연락처 전부 충족
            if (check()) {
              final int _id;
              //유효성 검증
              if (context.read<MessageProfileCubit>().state.messageModel ==
                  null) {
                _id =
                    context.read<MessageProfileCubit>().state.profileModel!.id;
              } else {
                _id = context
                    .read<MessageProfileCubit>()
                    .state
                    .messageModel!
                    .contacts![0]
                    .id;
              }

              print(_id);
              final MessageSentDto messageSentDto = new MessageSentDto(
                  sender_id: context.read<MyProfilesBloc>().state.data!.id,
                  content: _controller[0].text,
                  message_type_id: 1, //메세지 타입
                  receiver_id: _id);
              context
                  .read<SentMessageBloc>()
                  .add(SentEvent(sentDto: messageSentDto));
            }
          },
          child: Container(
            width: double.infinity,
            height: 7.h,
            decoration: ShapeDecoration(
              color: check() ? Color(0xFF02D289) : Color(0xFF999FA4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                '보내기',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5.5.h,
        ),
      ],
    );
  }
}
