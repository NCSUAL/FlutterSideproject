import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/bloc/ReceivedMessageBloc.dart';
import 'package:side_project/view/likeable/tabview/received_like_able/ReceivedHeart.dart';
import 'package:side_project/view/likeable/tabview/received_like_able/ReceivedRing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_project/view/loading/Loading.dart';

class Recieved_Like_Able extends StatefulWidget {
  const Recieved_Like_Able({super.key});

  @override
  State<Recieved_Like_Able> createState() => _Recieved_Like_AbleState();
}

class _Recieved_Like_AbleState extends State<Recieved_Like_Able> {
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

                //나에게 반지를 보냈어요
                ReceivedRing(),

                //나에게 하트를 보냈어요,
                ReceivedHeart(),
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
