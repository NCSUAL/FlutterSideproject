import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_project/bloc/SentMessageBloc.dart';
import 'package:side_project/bloc/TimeDailyFourIntroduceBloc.dart';

class BottomNavigationBarCubit extends Cubit<int> {
  BottomNavigationBarCubit() : super(0);

  //페이지 변경
  void setPage(BuildContext context, int index) {
    if (index == 0) {
      context.read<TimeDailyFourIntroduceBloc>().add(TimeCheckEvent());
    }
    emit(index);
  }
}
