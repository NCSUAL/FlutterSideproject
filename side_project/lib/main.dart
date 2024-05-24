import 'package:flutter/material.dart';
import 'package:side_project/home/Home.dart';
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
