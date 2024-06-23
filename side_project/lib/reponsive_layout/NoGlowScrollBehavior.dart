
import 'package:flutter/material.dart';

//스크롤 담김 효과 제거
class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child,
      AxisDirection axisDirection) {
    return child;
  }
}