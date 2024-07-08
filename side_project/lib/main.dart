import 'package:flutter/material.dart';
import 'package:side_project/bloc/DailyFourIntroduceBloc.dart';
import 'package:side_project/bloc/MyProfilesBloc.dart';
import 'package:side_project/bloc/OtherProfilesBloc.dart';
import 'package:side_project/bloc/ReceivedMessageBloc.dart';
import 'package:side_project/bloc/SentMessageBloc.dart';
import 'package:side_project/bloc/TimeDailyFourIntroduceBloc.dart';
import 'package:side_project/test/design.dart';
import 'package:side_project/view/home/DetailsProfile.dart';
import 'package:side_project/view/message/MessageProfile.dart';
import 'home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart' as getx;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(ResponsiveSizer(builder: (context, orientation, screenType) {
    //서비스'
    return MultiBlocProvider(
      providers: [
        BlocProvider(lazy: false, create: (context) => MyProfilesBloc()),
        BlocProvider(
            lazy: false, create: (context) => DailyFourIntroduceBloc()),
        BlocProvider(
            lazy: false, create: (context) => TimeDailyFourIntroduceBloc()),
        BlocProvider(lazy: false, create: (context) => ReceivedMessageBloc()),
        BlocProvider(lazy: false, create: (context) => SentMessageBloc()),
        BlocProvider(create: (context) => OtherProfilesBloc()),
      ],
      child: getx.GetMaterialApp(
        home: Home(),
        getPages: [
          getx.GetPage(
              name: '/MessageProfile',
              page: () => MessageProfile(),
              transition: getx.Transition.noTransition),
          getx.GetPage(
              name: '/DetailsProfile',
              page: () => DetailsProfile(),
              transition: getx.Transition.noTransition)
        ],
      ),
    );

    /**
    return getx.GetMaterialApp(
      home: Design(),
    );
    */

    //점검
  }));
}
