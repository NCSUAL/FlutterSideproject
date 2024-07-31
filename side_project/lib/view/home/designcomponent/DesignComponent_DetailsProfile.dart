import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/model/ProfileModel.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';

class DesignComponent_DetailsProfile extends StatelessWidget {
  final ProfileModel data;
  const DesignComponent_DetailsProfile({super.key, required this.data});

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
            height: 23.h,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return ProfileRow(
                  index: index,
                  data: data,
                );
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
  final ProfileModel data;
  ProfileRow({required this.index, required this.data});

  @override
  Widget build(BuildContext context) {
    List<String> _list = ['나이', '키', '지역', '직업', '담배', '술', '종교', '정치'];
    return Column(
      children: [
        Container(
          height: 3.5.h,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
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
                      fontSize: 17.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Container(
                    width: 20.w,
                    child: Text(
                      getTextForIndex(index + (this.index * 2)),
                      style: TextStyle(
                        color: Color(0xFF171B1C),
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              );
            },
            itemCount: 2,
          ),
        ),
        SizedBox(
          height: 2.3.h,
        ),
      ],
    );
  }

  String getTextForIndex(int combinedIndex) {
    switch (combinedIndex) {
      case 0:
        return '준비중';
      case 1:
        return data.height.toString();
      case 2:
        return data.residence;
      case 3:
        return data.job;
      case 4:
        return data.is_smoke ? '흡연자' : '비흡연자';
      case 5:
        return data.drinking_frequency;
      case 6:
        return data.religion;
      default:
        return '준비중';
    }
  }
}
