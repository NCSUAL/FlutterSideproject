import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:side_project/bloc/MyProfilesBloc.dart';
import 'dart:async';
import 'package:side_project/bloc/DailyFourIntroduceBloc.dart';
import 'package:side_project/bloc/ReceivedMessageBloc.dart';
import 'package:side_project/bloc/SentMessageBloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final MyProfilesBloc myProfilesBloc;
  final DailyFourIntroduceBloc dailyFourIntroduceBloc;
  final ReceivedMessageBloc receivedMessageBloc;
  final SentMessageBloc sentMessageBloc;
  StreamSubscription<MyProfileState>? streamSubMyProfile;
  StreamSubscription<DailyFourIntroduceState>? streamSubDailyFourIntroduce;
  StreamSubscription<ReceivedMessageState>? streamSubReceivedMessage;
  StreamSubscription<SentMessageState>? streamSubSentMessage;
  List<bool> _load = List.generate(4, (index) => false);
  SplashBloc(this.myProfilesBloc, this.dailyFourIntroduceBloc,
      this.receivedMessageBloc, this.sentMessageBloc)
      : super(InitialState()) {
    //myprofile 감지
    streamSubMyProfile = myProfilesBloc.stream.listen((event) async {
      if (event is LoadedMyProfileState) {
        _load[0] = true;
        check();
      }
    });

    //DailyFourIntroduce 감지
    streamSubDailyFourIntroduce = dailyFourIntroduceBloc.stream.listen((event) {
      if (event is LoadedDailyFourIntroduceState) {
        _load[1] = true;
        check();
      }
    });

    //ReceivedMessage 감지
    streamSubReceivedMessage = receivedMessageBloc.stream.listen((event) {
      if (event is LoadedReceivedMessageState) {
        _load[2] = true;
        check();
      }
    });

    //SentMessage 감지
    streamSubSentMessage = sentMessageBloc.stream.listen((event) {
      if (event is LoadedSentMessageState) {
        _load[3] = true;
        check();
      }
    });

    //모든 블럭을 불러와서 호출합니다.
    on<LoadBloc>(
      (event, emit) async {
        emit(LoadingBlocState());
        try {
          myProfilesBloc.add(LoadMyProfileEvent());
          receivedMessageBloc.add(ReceivedMessageLoadEvent());
          sentMessageBloc.add(SentMessageLoadEvent());
          dailyFourIntroduceBloc.add(LoadDailyFourIntroduceEvent());
        } catch (e) {
          print(e);
          emit(ErrorBlocState());
        }
      },
    );

    add(LoadBloc());
  }
  //모두 로드 됐는지 체크
  void check() {
    print(_load);
    if (_load.every((element) => element)) {
      emit(LoadedBlocState());
      close();
    }
  }

  //구독 취소, 블럭 닫기
  @override
  Future<void> close() {
    streamSubSentMessage?.cancel();
    streamSubReceivedMessage?.cancel();
    streamSubDailyFourIntroduce?.cancel();
    streamSubMyProfile?.cancel();
    return super.close();
  }
}

//event
abstract class SplashEvent extends Equatable {}

class LoadBloc extends SplashEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//state
abstract class SplashState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialState extends SplashState {}

class LoadingBlocState extends SplashState {}

class LoadedBlocState extends SplashState {}

class ErrorBlocState extends SplashState {}
