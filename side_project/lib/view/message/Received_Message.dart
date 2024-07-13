import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/model/MessageModel.dart';
import 'package:side_project/test/Image.dart';

class Received_Message extends StatelessWidget {
  final MessageModel data;
  const Received_Message({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    //텍스트 첫줄만 반환
    String getFirstLine(String? text) {
      List<String> _list = (text ?? '').split('\n');
      return _list[0];
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        double containerWidth = 100.w;
        double containerHeight = 13.h * 0.28;

        return Container(
          decoration: BoxDecoration(
            color: Colors.white, // Container 배경 색상 설정
            borderRadius: BorderRadius.circular(11),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),

                blurRadius: 5,
                offset: Offset(0, 3), // 그림자의 위치 조정
              ),
            ],
          ),
          width: containerWidth,
          height: containerHeight,
          padding: EdgeInsets.all(containerWidth * 0.04),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: containerHeight, // 반응형으로 조정
                backgroundColor: Color(0xFF171B1C),
                backgroundImage: NetworkImage(ImageTest.image),
              ),
              SizedBox(width: containerWidth * 0.02),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // Add this line
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(
                            '${data.sender_name}님',
                            style: TextStyle(
                              color: Color(0xFF171B1C),
                              fontSize: containerWidth * 0.04,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(width: containerWidth * 0.01),
                        Text(
                          '1000시간 전',
                          style: TextStyle(
                            color: Color(0xFF999FA4),
                            fontSize: containerWidth * 0.035,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: containerHeight * 0.21),
                    Flexible(
                      child: Text(
                        getFirstLine(data.content),
                        style: TextStyle(
                          color: Color(0xFF5A6166),
                          fontSize: containerWidth * 0.036,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
