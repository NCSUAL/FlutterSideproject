import 'package:flutter/material.dart';
import 'package:side_project/bloc/ReceivedMessageBloc.dart';
import 'package:side_project/bloc/SentMessageBloc.dart';
import 'package:side_project/reponsive_layout/NoGlowScrollBehavior.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_project/view/loading/Loading.dart';

class Sent_Like_Able extends StatefulWidget {
  const Sent_Like_Able({super.key});

  @override
  State<Sent_Like_Able> createState() => _Sent_Like_AbleState();
}

class _Sent_Like_AbleState extends State<Sent_Like_Able> {
  @override
  Widget build(BuildContext context) {
    final currentBloc = context.watch<SentMessageBloc>().state;
    if (currentBloc is LoadedSentMessageState) {
      return Scaffold(
        backgroundColor: Color(0xffF2F3F4),
        body: ScrollConfiguration(
          behavior: NoGlowScrollBehavior(), //담김 효과 제거,
          child: Column(
            children: [
              SizedBox(
                height: 3.5.h,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Component("서로 좋아해요", 28, 4, 15)],
              ),

              //리스트
            ],
          ),
        ),
      );
    } else {
      return Loading();
    }
  }
}
