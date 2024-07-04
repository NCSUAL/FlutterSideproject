import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class TimeDailyFourIntroduceBloc
    extends Bloc<TimeDailyFourIntroduceEvent, TimeDailyFourIntroduceState> {
  DateTime _dateTime = new DateTime.now();

  TimeDailyFourIntroduceBloc() : super(InitialTimeDailyFourIntroduceState()) {
    //시간 체크
    on<TimeCheckEvent>(
      (event, emit) async {
        //시간 재측정
        _dateTime = new DateTime.now();
        switch (_dateTime.hour) {
          case >= 20:
            emit(PassEightHourState());
            break;
          case >= 17:
            emit(PassFiveHourState());
            break;
          case >= 14:
            emit(PassTwoHourState());
            break;
        }
      },
    );

    //블럭 생성될때 이벤트 실행
    add(TimeCheckEvent());
  }
}

//event
abstract class TimeDailyFourIntroduceEvent extends Equatable {}

class TimeCheckEvent extends TimeDailyFourIntroduceEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//state
abstract class TimeDailyFourIntroduceState extends Equatable {
  final List<bool> passTime;

  TimeDailyFourIntroduceState({required this.passTime});

  @override
  // TODO: implement props
  List<Object?> get props => [passTime];
}

class InitialTimeDailyFourIntroduceState extends TimeDailyFourIntroduceState {
  InitialTimeDailyFourIntroduceState()
      : super(
            passTime: List.generate(4, (index) => (index < 1) ? true : false));
}

class PassTwoHourState extends TimeDailyFourIntroduceState {
  PassTwoHourState()
      : super(
            passTime: List.generate(4, (index) => (index < 2) ? true : false));
}

class PassFiveHourState extends TimeDailyFourIntroduceState {
  PassFiveHourState()
      : super(
            passTime: List.generate(4, (index) => (index < 3) ? true : false));
}

class PassEightHourState extends TimeDailyFourIntroduceState {
  PassEightHourState() : super(passTime: List.generate(4, (index) => true));
}
