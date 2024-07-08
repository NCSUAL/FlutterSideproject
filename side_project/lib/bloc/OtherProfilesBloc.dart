import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:side_project/model/ProfileModel.dart';
import 'package:side_project/controller/ApiController.dart';

class OtherProfilesBloc extends Bloc<OtherProfilesEvent, OtherProfilesState> {
  late ApiController apiController;
  OtherProfilesBloc() : super(InitOtherProfilesState()) {
    on<LoadOtherProfilesEvent>((event, emit) async {
      apiController = new ApiController<LoadOtherProfilesEvent>(id: event.id);
      emit(LoadingOtherProfilesState());
      try {
        final data = await apiController.apiCategorize();
        emit(LoadedOtherProfilesState(data: ProfileModel.fromJson(data.data)));
      } catch (e) {
        print(e);
        emit(ErrorOtherProfilesState());
      }
    });
  }
}

//event
abstract class OtherProfilesEvent extends Equatable {}

class LoadOtherProfilesEvent extends OtherProfilesEvent {
  final int id;
  LoadOtherProfilesEvent({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//state
abstract class OtherProfilesState extends Equatable {
  final ProfileModel? data;

  const OtherProfilesState({required this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitOtherProfilesState extends OtherProfilesState {
  InitOtherProfilesState() : super(data: null);
}

class LoadingOtherProfilesState extends OtherProfilesState {
  LoadingOtherProfilesState() : super(data: null);
}

class LoadedOtherProfilesState extends OtherProfilesState {
  LoadedOtherProfilesState({required super.data});
}

class ErrorOtherProfilesState extends OtherProfilesState {
  ErrorOtherProfilesState() : super(data: null);
}
