import 'package:bloc/bloc.dart';
import 'package:side_project/model/MessageModel.dart';
import 'package:equatable/equatable.dart';

class MessageProfileCubit extends Cubit<MessageProfileState> {
  MessageProfileCubit() : super(InitMessageProfileState());

  void updateState(MessageModel messageModel) {
    emit(UpdateMessageProfileState(messageModel: messageModel));
  }
}

//state
abstract class MessageProfileState extends Equatable {
  final MessageModel messageModel;
  const MessageProfileState({required this.messageModel});
  @override
  // TODO: implement props
  List<Object?> get props => [messageModel];
}

class InitMessageProfileState extends MessageProfileState {
  InitMessageProfileState() : super(messageModel: new MessageModel());
}

class UpdateMessageProfileState extends MessageProfileState {
  UpdateMessageProfileState({required super.messageModel});
}
