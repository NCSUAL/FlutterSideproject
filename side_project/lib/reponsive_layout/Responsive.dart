import 'package:flutter/material.dart';

Widget Image_Res(String image,double width){
  return LayoutBuilder(builder: (context, constraints) {
      return Image.asset(fit: BoxFit.cover,width: constraints.maxWidth*width,
          "assets/image/${image}.png");
  },);
}