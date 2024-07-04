import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:side_project/model/ProfileModel.dart';
import 'package:side_project/controller/ApiController.dart';

class MyProfilesBloc extends Bloc<MyProfileEvent, MyProfileState> {
  late ApiController apiController;
  MyProfilesBloc() : super(InitMtProfileState()) {
    on<LoadMyProfileEvent>((event, emit) async {
      apiController = new ApiController<LoadMyProfileEvent>();
      emit(LoadingMyProfileState());
      try {
        final data = await apiController.apiCategorize();

        emit(LoadedMyProfileState(data: ProfileModel.fromJson(data.data)));
      } catch (e) {
        emit(ErrorMyProfileState());
      }
    });

    //블럭 생성시 이벤트 실행
    add(LoadMyProfileEvent());

    //프로필 조회
    on<InquiryProfileEvent>((event, emit) async {
      apiController = new ApiController<InquiryProfileEvent>();
      emit(LoadingMyProfileState());
      try {
        final data = await apiController.apiCategorize();
      }
      catch (e) {
        print(e);
        emit(ErrorMyProfileState());
      }
    });

  }
}

//event
abstract class MyProfileEvent extends Equatable {}

class LoadMyProfileEvent extends MyProfileEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//프로빌 조회 이벤트
class InquiryProfileEvent extends MyProfileEvent {
  final int id;
  InquiryProfileEvent({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//state
abstract class MyProfileState extends Equatable {
  final ProfileModel? data;
  const MyProfileState({required this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitMtProfileState extends MyProfileState {
  InitMtProfileState() : super(data: null);
}

class LoadingMyProfileState extends MyProfileState {
  LoadingMyProfileState() : super(data: null);
}

class LoadedMyProfileState extends MyProfileState {
  LoadedMyProfileState({required super.data});
}

class ErrorMyProfileState extends MyProfileState {
  ErrorMyProfileState() : super(data: null);
}
