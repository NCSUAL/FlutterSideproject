import 'package:flutter/material.dart';
import 'package:side_project/bloc/DailyFourIntroduceBloc.dart';
import 'package:side_project/bloc/ReceivedMessageBloc.dart';
import 'package:side_project/bloc/SentMessageBloc.dart';
import 'package:side_project/bloc/TimeDailyFourIntroduceBloc.dart';
import 'package:side_project/cubit/BottomNavigationBarCubit.dart';
import 'package:side_project/view/home/HomeMain.dart';
import 'package:side_project/view/likeable/LikeAbleMain.dart';
import 'package:side_project/view/message/MessageMain.dart';
import 'package:side_project/view/profile/ProfileMain.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    const double _fontsize = 14;
    const List<Widget> screen = <Widget>[
      HomeMain(),
      LikeAbleMain(),
      MessageMain(),
      ProfileMain()
    ];

    return Scaffold(
      body:
          BlocBuilder<BottomNavigationBarCubit, int>(builder: (context, state) {
        return screen[state];
      }),
      backgroundColor: Colors.white,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          platform: TargetPlatform.iOS, //소리 제거
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x4C000000),
                  blurRadius: 0,
                  offset: Offset(0, -0.33),
                  spreadRadius: 0.35,
                )
              ],
            ),
            width: double.infinity,
            height: constraints.maxHeight * 0.08,
            child: Align(
              alignment: Alignment.topCenter,
              child: BlocBuilder<BottomNavigationBarCubit, int>(
                  builder: (context, state) {
                return BottomNavigationBar(
                  elevation: 0,
                  selectedItemColor: Color(0xff08D88F),
                  selectedLabelStyle: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: _fontsize.sp,
                      fontWeight: FontWeight.bold),
                  unselectedLabelStyle: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: _fontsize.sp,
                      fontWeight: FontWeight.w500),
                  type: BottomNavigationBarType.fixed,
                  onTap: (value) {
                    context
                        .read<BottomNavigationBarCubit>()
                        .setPage(context, value);
                  },
                  currentIndex: state,
                  backgroundColor: Colors.white,
                  items: [
                    BottomNavigationBarItem(
                        icon: Image_Res("home", 0.25),
                        label: "홈",
                        activeIcon: Image_Res("home_change", 0.25)),
                    BottomNavigationBarItem(
                        icon: Image_Res("heart", 0.25),
                        label: "호감",
                        activeIcon: Image_Res("heart_change", 0.25)),
                    BottomNavigationBarItem(
                        icon: Image_Res("chat", 0.25),
                        label: "메세지",
                        activeIcon: Image_Res("chat_change", 0.25)),
                    BottomNavigationBarItem(
                        icon: Image_Res("mypage", 0.25),
                        label: "마이페이지",
                        activeIcon: Image_Res("mypage_change", 0.25)),
                  ],
                );
              }),
            ),
          );
        }),
      ),
    );
  }
}
