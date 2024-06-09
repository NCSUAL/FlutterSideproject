import 'package:flutter/material.dart';
import 'controller/Controller_Navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
void main() {
  runApp(

      ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
              home: Navigation_Controller(),
            );
        }
      ));
}
