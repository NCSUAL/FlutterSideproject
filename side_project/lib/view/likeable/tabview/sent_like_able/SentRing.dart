import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:side_project/bloc/OtherProfilesBloc.dart';
import 'package:side_project/bloc/ReceivedMessageBloc.dart';
import 'package:side_project/bloc/SentMessageBloc.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:side_project/test/Image.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SentRing extends StatelessWidget {
  SentRing({super.key});
  @override
  Widget build(BuildContext context) {
    final state = context.watch<SentMessageBloc>().state;
    if (state.ring_receive.isNotEmpty) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Component('ring', 3.5, "내가 반지를 보냈어요", 44, 4.35, 15)],
          ),
          SizedBox(
            height: 2.7.h,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: (state.ring_receive.length + 1) ~/ 2,
            itemBuilder: (context, index) {
              int firstIndex = index * 2;
              int secondIndex = firstIndex + 1;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<OtherProfilesBloc>().add(
                            LoadOtherProfilesEvent(
                                id: state
                                    .ring_receive[firstIndex].contacts![0].id));
                        Get.toNamed("DetailsProfile");
                      },
                      child: likeAbleComponent2(
                          ImageTest.image,
                          state.ring_receive[firstIndex].sender_name!,
                          '1000시간 전'),
                    ),
                    if (secondIndex < state.ring_receive.length)
                      GestureDetector(
                        onTap: () {
                          context.read<OtherProfilesBloc>().add(
                              LoadOtherProfilesEvent(
                                  id: state.ring_receive[secondIndex]
                                      .contacts![0].id));
                          Get.toNamed("DetailsProfile");
                        },
                        child: likeAbleComponent2(
                            ImageTest.image,
                            state.ring_receive[secondIndex].sender_name!,
                            '1000시간 전'),
                      ),
                  ],
                ),
              );
            },
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
