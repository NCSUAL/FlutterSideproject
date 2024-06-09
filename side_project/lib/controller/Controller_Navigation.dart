import 'package:flutter/material.dart';
import 'package:side_project/home/HomeMain.dart';
import 'package:side_project/likeable/LikeAbleMain.dart';
import 'package:side_project/message/MessageMain.dart';
import 'package:side_project/profile/ProfileMain.dart';
import 'package:side_project/reponsive_layout/Responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class Navigation_Controller extends StatefulWidget {
  const Navigation_Controller({super.key});

  @override
  State<Navigation_Controller> createState() => _Navigation_ControllerState();
}

class _Navigation_ControllerState extends State<Navigation_Controller> {
  int _current = 0;
  final double _fontsize = 14;
  @override
  Widget build(BuildContext context) {
    const List<Widget> screen = <Widget>[
      HomeMain(),
      LikeAbleMain(),
      MessageMain(),
      ProfileMain()
    ];

    void _onTap(int index) {
      setState(() {
        _current = index;
      });
    }

    return Scaffold(
      body: screen[_current],
      backgroundColor: Colors.white,
      bottomNavigationBar: Theme(
        data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              platform: TargetPlatform.iOS, //소리 제거
        ),
        child: LayoutBuilder(
          builder: (context, constraints){
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x4C000000),
                    blurRadius: 0,
                    offset: Offset(0, -0.33),
                    spreadRadius: 0,
                  )
                ],
              ),
              width: double.infinity,
              height: constraints.maxHeight*0.08,
              child: Align(
                alignment: Alignment.topCenter,
                child: BottomNavigationBar(
                  elevation: 0,
                  selectedItemColor: Color(0xff08D88F),
                  selectedLabelStyle: TextStyle(
                    fontFamily: "Pretendard",
                    fontSize:_fontsize.sp,
                    fontWeight: FontWeight.bold
                  ),
                  unselectedLabelStyle: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: _fontsize.sp,
                      fontWeight: FontWeight.w500
                  ),
                  type: BottomNavigationBarType.fixed,
                  onTap: _onTap,
                  currentIndex: _current,
                  backgroundColor: Colors.white,
                  items: [
                    BottomNavigationBarItem(
                        icon: Image_Res("home",0.25), label: "홈"
                        ,activeIcon: Image_Res("home_change",0.25)
                    ),
                    BottomNavigationBarItem(
                        icon: Image_Res("heart",0.25), label: "호감"
                        ,activeIcon: Image_Res("heart_change",0.25)
                    ),
                    BottomNavigationBarItem(
                        icon: Image_Res("chat",0.25), label: "메세지"
                        ,activeIcon: Image_Res("chat_change",0.25)
                    ),
                    BottomNavigationBarItem(
                        icon: Image_Res("mypage",0.25), label: "마이페이지"
                        ,activeIcon: Image_Res("mypage_change",0.25)
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
