import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/bloc/Message_Received_Bloc_API.dart';
import 'package:side_project/message/Received_Message.dart';
import 'package:side_project/message/appbar/MessageAppbar.dart';
import 'package:side_project/model/Message_Model.dart';
import 'package:side_project/model/Message_Models.dart';
class MessageMain extends StatefulWidget {
  const MessageMain({super.key});

  @override
  State<MessageMain> createState() => _MessageMainState();
}

class _MessageMainState extends State<MessageMain> {
  final Message_Received_Bloc_API _message_received_bloc_api = new Message_Received_Bloc_API();
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
          behavior: NoGlowScrollBehavior(), //담김 효과 제거
          child:
            //기본 사이즈
            //SizedBox(height: 1.5.h,),
            Column(
              children: [

                SizedBox(height: 2.2.h,),

                Expanded(
                  child: StreamBuilder<Message_Models>(
                    stream: _message_received_bloc_api.stream,
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        List<Message_Model>? datas = snapshot.data?.datas;
                  
                        return ListView.builder(
                            itemCount: datas?.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width*0.044,
                                  vertical: height*0.005
                              ),
                              child: SizedBox(
                                  height: 11.5.h,
                                  child: Received_Message()),
                            );
                          },
                        );
                      }
                      else{
                        return Center(child: Container(height: 4.h,child: CircularProgressIndicator(strokeWidth: 2,)));
                      }
                  
                    }
                  ),
                ),
              ],
            )

        ),
      ),
    );
  }
}
class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}