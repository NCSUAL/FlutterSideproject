import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';

class DesignComponent1 extends StatelessWidget {
  const DesignComponent1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.9.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '프로필',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17.7.sp,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Container(
            height: 30.h,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return ProfileRow(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileRow extends StatelessWidget {
  final int index;
  ProfileRow({required this.index});

  @override
  Widget build(BuildContext context) {
    List<String> _list = ['나이', '키', '지역', '직업', '담배', '술', '종교', '정치'];
    return Column(
      children: [
        Container(
          height: 3.5.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                      width: 5.w,
                      child: Image_Res(
                          'profile' + '${index + (this.index * 2) + 1}', 1)),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(
                    _list[index + (this.index * 2)],
                    style: TextStyle(
                      color: Color(0xFF171B1C),
                      fontSize: 16.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    width: 3.7.w,
                  ),
                  Text(
                    'test',
                    style: TextStyle(
                      color: Color(0xFF171B1C),
                      fontSize: 16.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                ],
              );
            },
            itemCount: 2,
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
      ],
    );
  }
}
