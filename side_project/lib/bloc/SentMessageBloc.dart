import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:side_project/controller/ApiController.dart';
import 'package:side_project/dto/MessageSentDto.dart';
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
        final _mappingMessageModel = MappingMessageModel.fromJson(data.data);
        emit(LoadedSentMessageState(
            sent_message: _mappingMessageModel.alldatas,
            ring_receive: _mappingMessageModel.ringdatas,
            heart_receive: _mappingMessageModel.heartdatas));
      } catch (e) {
        emit(ErrorMessageState());
      }
    });
    //블럭 주입시 이벤트 실행
    add(SentMessageLoadEvent());

    on<SentEvent>((event, emit) {
      try {
        apiController =
            new ApiController<SentEvent>(messageSentDto: event.sentDto);
        apiController.apiCategorize();
      } catch (e) {
        print(e);
        throw Exception("api 요청 오류");
      }
    });
  }
}

//event
abstract class SentMessageEvent extends Equatable {}

class SentMessageLoadEvent extends SentMessageEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//메세지 보내기
class SentEvent extends SentMessageEvent {
  //DI
  final MessageSentDto sentDto;
  SentEvent({required this.sentDto});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//state
abstract class SentMessageState extends Equatable {
  //상태관리 대상
  final List<MessageModel> sent_message;
  final List<MessageModel> heart_receive;
  final List<MessageModel> ring_receive;
  const SentMessageState(
      {required this.sent_message,
      required this.heart_receive,
      required this.ring_receive});

  @override
  // TODO: implement props
  List<Object?> get props => [sent_message];
}

class InitSentMessageState extends SentMessageState {
  InitSentMessageState()
      : super(sent_message: [], heart_receive: [], ring_receive: []);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingSentMessageState extends SentMessageState {
  LoadingSentMessageState()
      : super(sent_message: [], ring_receive: [], heart_receive: []);
}

class LoadedSentMessageState extends SentMessageState {
  LoadedSentMessageState(
      {required super.sent_message,
      required super.heart_receive,
      required super.ring_receive});
}

class ErrorMessageState extends SentMessageState {
  ErrorMessageState()
      : super(sent_message: [], heart_receive: [], ring_receive: []);
}
