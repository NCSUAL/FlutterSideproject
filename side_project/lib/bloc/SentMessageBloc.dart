import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:side_project/controller/ApiController.dart';
import 'package:side_project/model/MessageModel.dart';
/**
 *  이 클래스를 만드는 이유
 *  이전 값을 저장 할 수 있는 경로가 없음.
 *  Sharedpreference는 효과적인 방법이 아님 state를 저장했다가 넘기는 게 방법이 될 수는 없음..
 */

class SentMessageBloc extends Bloc<SentMessageEvent, SentMessageState> {
  late ApiController apiController;
  SentMessageBloc() : super(InitSentMessageState()) {
    //보낸 메세지 - 탭 할 경우 로드
    on<SentMessageLoadEvent>((event, emit) async {
      apiController = new ApiController<SentMessageLoadEvent>();

      //로딩상태
      emit(LoadingSentMessageState());

      try {
        final data = await apiController.apiCategorize();

        if (data != null) {
          emit(LoadedSentMessageState(
              sent_message: MappingMessageModel.fromJson(data.data).datas));
        } else {
          emit(ErrorMessageState());
        }
      } catch (e) {
        emit(ErrorMessageState());
      }
    });

    //블럭생성시 이벤트 실행
    add(SentMessageLoadEvent());
  }
}

//event
abstract class SentMessageEvent extends Equatable {}

class SentMessageLoadEvent extends SentMessageEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//state
abstract class SentMessageState extends Equatable {
  //상태관리 대상
  final List<MessageModel> sent_message;
  const SentMessageState({required this.sent_message});

  @override
  // TODO: implement props
  List<Object?> get props => [sent_message];
}

class InitSentMessageState extends SentMessageState {
  InitSentMessageState() : super(sent_message: []);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingSentMessageState extends SentMessageState {
  LoadingSentMessageState() : super(sent_message: []);
}

class LoadedSentMessageState extends SentMessageState {
  LoadedSentMessageState({required super.sent_message});
}

class ErrorMessageState extends SentMessageState {
  ErrorMessageState() : super(sent_message: []);
}
