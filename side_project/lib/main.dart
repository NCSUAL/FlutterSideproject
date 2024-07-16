import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:side_project/bloc/DailyFourIntroduceBloc.dart';
import 'package:side_project/bloc/MyProfilesBloc.dart';
import 'package:side_project/bloc/OtherProfilesBloc.dart';
import 'package:side_project/bloc/ReceivedMessageBloc.dart';
import 'package:side_project/bloc/SentMessageBloc.dart';
import 'package:side_project/bloc/TimeDailyFourIntroduceBloc.dart';
import 'package:side_project/controller/BottomNavigationBarCubit.dart';
import 'package:side_project/login/bloc/SplashBloc.dart';
import 'package:side_project/login/splash/Splash.dart';
import 'package:side_project/test/design.dart';
import 'package:side_project/view/home/DetailsProfile.dart';
import 'package:side_project/view/message/MessageProfile.dart';
import 'home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart' as getx;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  //로고 로딩 될때까지 기다림(스플래시)
  WidgetsFlutterBinding.ensureInitialized();
  await rootBundle.load('assets/image/logo.png');
  runApp(ResponsiveSizer(builder: (context, orientation, screenType) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DailyFourIntroduceBloc()),
        BlocProvider(create: (context) => MyProfilesBloc()),
        BlocProvider(create: (context) => ReceivedMessageBloc()),
        BlocProvider(create: (context) => SentMessageBloc()),
        BlocProvider(create: (context) => OtherProfilesBloc()),
        BlocProvider(create: (context) => TimeDailyFourIntroduceBloc()),
        BlocProvider(
            lazy: false,
            create: (context) => SplashBloc(
                context.read<MyProfilesBloc>(),
                context.read<DailyFourIntroduceBloc>(),
                context.read<ReceivedMessageBloc>(),
                context.read<SentMessageBloc>())),
      ],
      //main
      child: getx.GetMaterialApp(
        home: BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
          print(state);
          if (state is LoadedBlocState) {
            return BlocProvider(
                create: (context) => BottomNavigationBarCubit(), child: Home());
          } else {
            return Splash();
          }
        }),

        //라우트 관리
        getPages: [
          getx.GetPage(
              name: '/MessageProfile',
              page: () => MessageProfile(),
              transition: getx.Transition.noTransition),
          getx.GetPage(
              name: '/DetailsProfile',
              page: () => DetailsProfile(),
              transition: getx.Transition.noTransition),
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
