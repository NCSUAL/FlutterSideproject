import 'package:flutter/material.dart';
import 'package:side_project/bloc/ReceivedMessageBloc.dart';
import 'package:side_project/bloc/SentMessageBloc.dart';
import 'package:side_project/reponsive_layout/NoGlowScrollBehavior.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_project/view/likeable/tabview/received_like_able/ReceivedHeart.dart';
import 'package:side_project/view/likeable/tabview/received_like_able/ReceivedRing.dart';
import 'package:side_project/view/likeable/tabview/sent_like_able/SentHeart.dart';
import 'package:side_project/view/likeable/tabview/sent_like_able/SentRing.dart';
import 'package:side_project/view/loading/Loading.dart';

class Sent_Like_Able extends StatefulWidget {
  const Sent_Like_Able({super.key});

  @override
  State<Sent_Like_Able> createState() => _Sent_Like_AbleState();
}

class _Sent_Like_AbleState extends State<Sent_Like_Able> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F3F4),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior()
            .copyWith(overscroll: false), // 담김 효과 제거 overscroll
        child: BlocBuilder<ReceivedMessageBloc, ReceivedMessageState>(
            builder: (context, state) {
          if (state is LoadedReceivedMessageState) {
            return ListView(
              children: [
                SizedBox(
                  height: 3.5.h,
                ),

                //내가 반지를 보냈어요
                SentRing(),

                //내가 하트를 보냈어요,
                SentHeart(),
              ],
            );
          } else {
            return Loading();
          }
        }),
      ),
    );
  }
}
