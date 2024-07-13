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

        //폰 등록 여부
        apiController = new ApiController<RegistrationPhoneNumberEvent>();

        final registrationPhoneNumber = await apiController.apiCategorize();
        if (registrationPhoneNumber.statusCode != 200) {
          emit(LoadedMyProfileState(
              data: ProfileModel.fromJson(data.data), phone_number: false));
        } else {
          emit(LoadedMyProfileState(
              data: ProfileModel.fromJson(data.data), phone_number: true));
        }
      } catch (e) {
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

//폰 등록 여부
class RegistrationPhoneNumberEvent extends MyProfileEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//state
abstract class MyProfileState extends Equatable {
  final ProfileModel? data;
  final bool phone_number;
  const MyProfileState({required this.data, required this.phone_number});

  @override
  // TODO: implement props
  List<Object?> get props => [data];
}

class InitMtProfileState extends MyProfileState {
  InitMtProfileState() : super(data: null, phone_number: false);
}

class LoadingMyProfileState extends MyProfileState {
  LoadingMyProfileState() : super(data: null, phone_number: false);
}

class LoadedMyProfileState extends MyProfileState {
  LoadedMyProfileState({required super.data, required super.phone_number});
}

class ErrorMyProfileState extends MyProfileState {
  ErrorMyProfileState() : super(data: null, phone_number: false);
}
