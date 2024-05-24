import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/message/appbar/MessageAppbar.dart';
class MessageMain extends StatefulWidget {
  const MessageMain({super.key});

  @override
  State<MessageMain> createState() => _MessageMainState();
}

class _MessageMainState extends State<MessageMain> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: MessageAppbar(),
          preferredSize: Size.fromHeight(6.5.h),
        ),
        backgroundColor: Color(0xffF2F3F4),
        body: Center(child: Text("page")),
      ),
    );
  }
}
