import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class Received_Message extends StatelessWidget {
  const Received_Message({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double containerWidth = 100.w;
        double containerHeight = 13.h * 0.28;

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
          elevation: 2,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Container 배경 색상 설정
              borderRadius: BorderRadius.circular(9),
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
                  backgroundImage: NetworkImage("https://via.placeholder.com/58x75"),

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
                              'bright98님',
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
                            '2시간 전',
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
                          '대화하고 싶어서 연락드려요~ 좋으신분 같...',
                          style: TextStyle(
                            color: Color(0xFF5A6166),
                            fontSize: containerWidth * 0.036,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
