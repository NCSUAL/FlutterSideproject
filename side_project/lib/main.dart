import 'package:flutter/material.dart';
import 'home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
void main() {
  runApp(

      ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
              home: Home(),
            );
        }
      ));
}
