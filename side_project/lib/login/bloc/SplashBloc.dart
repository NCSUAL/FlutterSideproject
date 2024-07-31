import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:side_project/bloc/MyProfilesBloc.dart';
import 'dart:async';
import 'package:side_project/bloc/DailyFourIntroduceBloc.dart';
import 'package:side_project/bloc/ReceivedMessageBloc.dart';
import 'package:side_project/bloc/SentMessageBloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(InitialState()) {
    emit(LoadedBlocState());
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
