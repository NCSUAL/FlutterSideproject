import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/statemanagement//Bloc_API.dart';
import 'package:side_project/view/message/MessageEmpty.dart';
import 'package:side_project/view/message/Received_Message.dart';
import 'package:side_project/view/message/appbar/MessageAppbar.dart';
import 'package:side_project/reponsive_layout/NoGlowScrollBehavior.dart';
import 'package:side_project/model/Message_Model.dart';
import 'package:side_project/model/Message_Models.dart';
class MessageMain extends StatefulWidget {
  const MessageMain({super.key});

  @override
  State<MessageMain> createState() => _MessageMainState();
}

class _MessageMainState extends State<MessageMain> {
  final Bloc_API<Message_Models> _message_received_bloc_api = new Bloc_API<Message_Models>();
  @override
  void initState() {
    // TODO: implement initState
    _message_received_bloc_api.get_Data();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: MessageAppbar(text: "나에게 온 메세지",image: "message_2",),
          preferredSize: Size.fromHeight(6.5.h),
        ),
        backgroundColor: Color(0xffF2F3F4),
        body: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false), //담김 효과 제거 overscroll
          child:
            StreamBuilder<Message_Models>(
              stream: _message_received_bloc_api.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Message_Model>? datas = snapshot.data?.datas;

                  if (datas!.length > 0) {
                    return ListView.builder(
                      itemCount: datas?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: index == 0 ? EdgeInsets.only(
                            top: height * 0.033,
                            left: width * 0.044,
                            right: width * 0.044,
                            bottom: height * 0.005,
                          ) :
                          EdgeInsets.symmetric(
                              horizontal: width * 0.044,
                              vertical: height * 0.005
                          ),
                          child: SizedBox(
                              height: 11.3.h,
                              child: Received_Message(data: datas![index])),
                        );
                      },
                    );
                  }
                  else{
                    return MessageEmpty();
                  }

                }

                else {
                  return Center(child: Container(height: 4.h,
                      child: CircularProgressIndicator(strokeWidth: 2,)));
                }

              }
            )

        ),
      ),
    );
  }
}