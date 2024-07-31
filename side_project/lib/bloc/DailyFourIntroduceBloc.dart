import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:side_project/controller/ApiController.dart';
import 'package:side_project/model/FourIntroduceModel.dart';

class DailyFourIntroduceBloc
    extends Bloc<DailyFourIntroduceEvent, DailyFourIntroduceState> {
  late ApiController apiController;
  DailyFourIntroduceBloc() : super(InitialDailyFourIntroduceState()) {
    //데이터 로드
    on<LoadDailyFourIntroduceEvent>(
      (event, emit) async {
        apiController = new ApiController<DailyFourIntroduceBloc>();
        try {
          emit(LoadingDailyFourIntroduceState());
          final response = await apiController.apiCategorize();
          emit(LoadedDailyFourIntroduceState(
              datas: MappingFourIntroduceModel.fromJson(response.data).datas));
        } catch (e) {
          emit(ErrorDailyFourIntroduceState());
        }
      },
    );

    add(LoadDailyFourIntroduceEvent());
  }
}

//event
abstract class DailyFourIntroduceEvent extends Equatable {}

class LoadDailyFourIntroduceEvent extends DailyFourIntroduceEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//state
abstract class DailyFourIntroduceState extends Equatable {
  //상태관리 대상
  final List<FourIntroduceModel> datas;

  DailyFourIntroduceState({required this.datas});

  //private + getter
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialDailyFourIntroduceState extends DailyFourIntroduceState {
  InitialDailyFourIntroduceState() : super(datas: []);

  //private + getter
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingDailyFourIntroduceState extends DailyFourIntroduceState {
  LoadingDailyFourIntroduceState() : super(datas: []);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedDailyFourIntroduceState extends DailyFourIntroduceState {
  LoadedDailyFourIntroduceState({required super.datas});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ErrorDailyFourIntroduceState extends DailyFourIntroduceState {
  ErrorDailyFourIntroduceState() : super(datas: []);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
