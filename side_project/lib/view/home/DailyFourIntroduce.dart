import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_project/bloc/DailyFourIntroduceBloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/bloc/OtherProfilesBloc.dart';
import 'package:side_project/bloc/TimeDailyFourIntroduceBloc.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:side_project/view/loading/Loading.dart';
import 'package:get/get.dart';

class DailyFourIntroduce extends StatelessWidget {
  const DailyFourIntroduce({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {"image": "", "text": "마카롱, 29세"},
      {"image": "", "text": "오후 2시에 만나요!"},
      {"image": "", "text": "오후 5시에 만나요!"},
      {"image": "", "text": "오후 8시에 만나요!"},
    ];

    return BlocBuilder<DailyFourIntroduceBloc, DailyFourIntroduceState>(
      builder: (context, state) {
        if (state is LoadedDailyFourIntroduceState) {
          final TimeDailyFourIntroduceState timeDailyFourIntroduceState =
              context.watch<TimeDailyFourIntroduceBloc>().state;
          return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4, // 너비와 높이 비율 설정
              crossAxisSpacing: 2.7.w,
              mainAxisSpacing: 4.h,
              physics: NeverScrollableScrollPhysics(), // 스크롤 비활성화
              children: [
                for (int a = 0; a < 4; a++)
                  timeDailyFourIntroduceState.passTime[a]
                      ? GestureDetector(
                          onTap: () {
                            Get.toNamed('/DetailsProfile');
                            context.read<OtherProfilesBloc>().add(
                                LoadOtherProfilesEvent(id: state.datas[a].id));
                          },
                          child: CustomGridItem(
                            image: "",
                            text: state.datas[a].nickname!,
                          ),
                        )
                      : CustomGridItem(
                          image: items[a]["image"]!,
                          text: items[a]["text"]!,
                        )
              ]);
        } else {
          return Loading();
        }
      },
    );
  }
}

class CustomGridItem extends StatelessWidget {
  final String image;
  final String text;

  CustomGridItem({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFD1D3D4),
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          height: 24.h,
          child: Center(
              child: SizedBox(width: 21.5.w, child: Image_Res('Mask', 1))),
        ),
        SizedBox(
          height: 1.2.h,
        ),
        Text(
          text,
          style: TextStyle(
            color: Color(0xFF171B1C),
            fontSize: 15.4.sp,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ],
    );
  }
}
