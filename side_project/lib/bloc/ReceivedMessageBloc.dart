import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';
import 'package:side_project/dto/MessageUpdateDto.dart';
import 'package:side_project/model/MessageModel.dart';
import '../controller/ApiController.dart';

class ReceivedMessageBloc
    extends Bloc<ReceivedMessageEvent, ReceivedMessageState> {
  late ApiController apiController;
  ReceivedMessageBloc() : super(InitMessageState()) {
    //데이터 로드
    on<ReceivedMessageLoadEvent>((event, emit) async {
      // 현재상태 - 로딩
      emit(LoadingReceivedMessageState());

      //제네릭 의존관계 주입
      apiController = new ApiController<ReceivedMessageLoadEvent>();

      try {
        // api/v1/message/  - get
        final datas = await apiController.apiCategorize();
        if (datas.data != null) {
          final _mappingMessageModel = MappingMessageModel.fromJson(datas.data);
          emit(LoadedReceivedMessageState(
              receive_message: _mappingMessageModel.alldatas,
              ring_receive: _mappingMessageModel.ringdatas,
              heart_receive: _mappingMessageModel.heartdatas));
        } else {
          emit(ErrorMessageState());
        }
      } catch (e) {
        print(e);
        emit(ErrorMessageState());
      }
    });

    //블럭 주입시 이벤트 실행
    add(ReceivedMessageLoadEvent());

    //메세지 거절
    on<ReceivedMessagedRefuseEvent>((event, emit) async {
      //로딩 상태
      emit(LoadingReceivedMessageState());
      //제네릭 의존관계 주입
      apiController = new ApiController<ReceivedMessagedRefuseEvent>(
          refuseDto: event._messageUpdateDto);

      await apiController.apiCategorize();

      //받은 메세지 데이터 로드
      add(ReceivedMessageLoadEvent());
    });
  }
}

//event
abstract class ReceivedMessageEvent extends Equatable {}

//받은 메세지 처리
class ReceivedMessageLoadEvent extends ReceivedMessageEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//받은 메세지 거절
class ReceivedMessagedRefuseEvent extends ReceivedMessageEvent {
  final MessageUpdateDto _messageUpdateDto;

  ReceivedMessagedRefuseEvent(this._messageUpdateDto);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//state
abstract class ReceivedMessageState extends Equatable {
  //상태관리 대상
  final List<MessageModel> receive_message;
  final List<MessageModel> heart_receive;
  final List<MessageModel> ring_receive;
  const ReceivedMessageState(
      {required this.receive_message,
      required this.heart_receive,
      required this.ring_receive});

  //getter + private
  @override
  List<Object?> get props => [receive_message];
}

class InitMessageState extends ReceivedMessageState {
  //init
  InitMessageState()
      : super(receive_message: [], heart_receive: [], ring_receive: []);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingReceivedMessageState extends ReceivedMessageState {
  LoadingReceivedMessageState()
      : super(receive_message: [], ring_receive: [], heart_receive: []);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedReceivedMessageState extends ReceivedMessageState {
  const LoadedReceivedMessageState(
      {required super.receive_message,
      required super.heart_receive,
      required super.ring_receive});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ErrorMessageState extends ReceivedMessageState {
  ErrorMessageState()
      : super(receive_message: [], heart_receive: [], ring_receive: []);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
