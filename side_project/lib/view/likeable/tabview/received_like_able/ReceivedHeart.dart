import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_project/bloc/OtherProfilesBloc.dart';
import 'package:side_project/bloc/ReceivedMessageBloc.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/test/Image.dart';
import 'package:side_project/view/loading/Loading.dart';
import 'package:get/get.dart';

class ReceivedHeart extends StatelessWidget {
  const ReceivedHeart({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ReceivedMessageBloc>().state;
    if (state.heart_receive.isNotEmpty) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Component('heart_white', 4.6, "나에게 하트를 보냈어요", 47, 4.35, 15)
            ],
          ),
          SizedBox(
            height: 2.7.h,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: (state.heart_receive.length + 1) ~/ 2,
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
                                id: state.heart_receive[firstIndex].contacts![0]
                                    .id));
                        Get.toNamed("DetailsProfile");
                      },
                      child: likeAbleComponent2(
                          ImageTest.image,
                          state.heart_receive[firstIndex].sender_name!,
                          '1000시간 전'),
                    ),
                    if (secondIndex < state.heart_receive.length)
                      GestureDetector(
                        onTap: () {
                          context.read<OtherProfilesBloc>().add(
                              LoadOtherProfilesEvent(
                                  id: state.heart_receive[secondIndex]
                                      .contacts![0].id));
                          Get.toNamed("DetailsProfile");
                        },
                        child: likeAbleComponent2(
                            ImageTest.image,
                            state.heart_receive[secondIndex].sender_name!,
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
