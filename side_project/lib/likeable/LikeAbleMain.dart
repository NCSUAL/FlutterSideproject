import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/message/appbar/MessageAppbar.dart';
import './tabbar/CustomTab.dart';

class LikeAbleMain extends StatefulWidget {
  const LikeAbleMain({super.key});

  @override
  State<LikeAbleMain> createState() => _LikeAbleMainState();
}

class _LikeAbleMainState extends State<LikeAbleMain> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(6.5.h),
          child: MessageAppbar(text: "나의 호감 현황"),
        ),
        backgroundColor: Color(0xffF2F3F4),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: TabBar(
                padding: EdgeInsets.only(left: 5.3.w,top: 0.5.h,bottom: 2.5.h),
                controller: _tabController,
                indicator: BoxDecoration(

                ), // indicator 제거
                labelPadding: EdgeInsets.symmetric(horizontal: 1.w), // 탭 사이 간격 제거
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                tabs: [
                  CustomTab(
                    label: '받은 호감',
                    selected: _tabController.index == 0,
                  ),
                  CustomTab(
                    label: '보낸 호감',
                    selected: _tabController.index == 1,
                  ),
                  CustomTab(
                    label: '스쳐간 반쪽',
                    selected: _tabController.index == 2,
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Center(child: Text("받은 호감 내용")),
                  Center(child: Text("보낸 호감 내용")),
                  Center(child: Text("스쳐간 반쪽 내용")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
