import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage1_TOS extends StatelessWidget {
  const LoginPage1_TOS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Text(
              '약관 동의가 필요해요',
              style: TextStyle(
                color: Color(0xFF171B1C),
                fontSize: 23.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 1.5,
              ),
            ),
            SizedBox(height: 3.h),
            _buildAgreementItem('전체 동의하기', true),
            SizedBox(height: 1.h),
            _buildAgreementItem('이용약관 동의', true),
            SizedBox(height: 1.h),
            _buildAgreementItem('개인정보 수집 및 이용 동의', true),
            SizedBox(height: 1.h),
            _buildAgreementItem('위치정보 이용약관 동의', true),
            SizedBox(height: 1.h),
            _buildAgreementItem('민감정보 이용 동의', true),
            SizedBox(height: 1.h),
            _buildAgreementItem('마케팅 수신 동의(선택)', true),
            Spacer(),
            Container(
              width: double.infinity,
              height: 58,
              decoration: ShapeDecoration(
                color: Color(0xFF999FA4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  '동의',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }

  Widget _buildAgreementItem(String title, bool isChecked) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: ShapeDecoration(
        color: Color(0xFFF7F8F9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Row(
        children: [
          Icon(
            isChecked ? Icons.check_circle : Icons.radio_button_unchecked,
            color: Color(0xFFC5C8CE),
            size: 30.sp,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20.sp),
        ],
      ),
    );
  }
}
