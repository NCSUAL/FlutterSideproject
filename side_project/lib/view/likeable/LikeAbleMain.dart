import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/view/likeable/tabview/Received_Like_Able.dart';
import 'package:side_project/view/likeable/tabview/Sent_Like_Able.dart';
import 'package:side_project/view/message/appbar/MessageAppbar.dart';
import './tabbar/CustomTab.dart';

class LikeAbleMain extends StatefulWidget {
  const LikeAbleMain({super.key});

  @override
  State<LikeAbleMain> createState() => _LikeAbleMainState();
}

class _LikeAbleMainState extends State<LikeAbleMain>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 3, vsync: this, animationDuration: Duration.zero //애니메이션 제거
        );
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
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: TabBar(
                padding:
                    EdgeInsets.only(left: 5.65.w, top: 0.5.h, bottom: 2.5.h),
                controller: _tabController,
                indicator: BoxDecoration(), // indicator 제거
                labelPadding:
                    EdgeInsets.symmetric(horizontal: 1.w), // 탭 사이 간격 제거
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                tabs: [
                  CustomTab(
                    label: '받은 호감',
                    selected: _tabController.index == 0,
                    width: 21.9,
                  ),
                  CustomTab(
                    label: '보낸 호감',
                    selected: _tabController.index == 1,
                    width: 21.9,
                  ),
                  CustomTab(
                    label: '스쳐간 반쪽',
                    selected: _tabController.index == 2,
                    width: 24,
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(), //애니메이션 제거
                controller: _tabController,
                children: [
                  Recieved_Like_Able(),
                  Sent_Like_Able(),
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
