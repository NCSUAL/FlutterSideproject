import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTab extends StatelessWidget {
  final String label;
  final bool selected;
  final double width;
  const CustomTab({
    required this.label,
    required this.selected,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero, // 간격 제거
      width: width.w,
      padding: EdgeInsets.symmetric( vertical: 1.2.h),
      decoration: ShapeDecoration(
        color: selected ? Color(0xFF41474C) : Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFF41474C)),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Color(0xFF41474C),
            fontSize: 15.sp,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
            height: 1.0,
          ),
        ),
      ),
    );
  }
}
