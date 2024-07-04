import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/bloc/ReceivedMessageBloc.dart';
import 'package:side_project/view/loading/Loading.dart';
import 'package:side_project/view/message/MessageEmpty.dart';
import 'package:side_project/view/message/Received_Message.dart';
import 'package:side_project/view/message/appbar/MessageAppbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getx;

class MessageMain extends StatelessWidget {
  const MessageMain({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF2F3F4),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(6.5.h),
          child: MessageAppbar(
            text: "나에게 온 메세지",
            image: "message_2",
          ),
        ),
        body: ScrollConfiguration(
          behavior: const ScrollBehavior()
              .copyWith(overscroll: false), // 담김 효과 제거 overscroll
          child: BlocBuilder<ReceivedMessageBloc, ReceivedMessageState>(
            builder: (context, state) {
              if (state is LoadedReceivedMessageState) {
                if (state.receive_message.length > 0) {
                  return ListView.builder(
                    itemCount: state.receive_message.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: index == 0
                            ? EdgeInsets.only(
                                top: height * 0.035,
                                left: width * 0.058,
                                right: width * 0.058,
                                bottom: height * 0.01,
                              )
                            : EdgeInsets.symmetric(
                                horizontal: width * 0.058,
                                vertical: height * 0.01,
                              ),
                        child: GestureDetector(
                          child: SizedBox(
                            height: 10.45.h,
                            child: Received_Message(
                                data: state.receive_message[index]),
                          ),
                          onTap: () {
                            getx.Get.toNamed('/MessageProfile',
                                arguments: state.receive_message[index]);
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return MessageEmpty();
                }
              } else {
                return Loading();
              }
            },
          ),
        ),
      ),
    );
  }
}
