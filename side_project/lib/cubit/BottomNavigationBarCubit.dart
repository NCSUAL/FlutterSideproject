import 'package:bloc/bloc.dart';

class BottomNavigationBarCubit extends Cubit<int> {
  BottomNavigationBarCubit() : super(0);

  //페이지 변경
  void setPage(int index) {
    emit(index);
  }
}
