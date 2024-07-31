import 'package:bloc/bloc.dart';
import 'package:side_project/model/MessageModel.dart';
import 'package:equatable/equatable.dart';
import 'package:side_project/model/ProfileModel.dart';

class MessageProfileCubit extends Cubit<MessageProfileState> {
  MessageProfileCubit() : super(InitMessageProfileState());

  void updateState(MessageModel messageModel) {
    emit(UpdateMessageProfileState(messageModel: messageModel));
  }

  void updateState_Pr(ProfileModel profileModel) {
    emit(UpdateProfileState(profileModel: profileModel));
  }
}

//state
abstract class MessageProfileState extends Equatable {
  final MessageModel? messageModel;
  final ProfileModel? profileModel;
  const MessageProfileState({this.messageModel, this.profileModel});
  @override
  // TODO: implement props
  List<Object?> get props => [messageModel, profileModel];
}

class InitMessageProfileState extends MessageProfileState {
  InitMessageProfileState() : super(messageModel: new MessageModel());
}

class UpdateMessageProfileState extends MessageProfileState {
  UpdateMessageProfileState({required super.messageModel});
}

class UpdateProfileState extends MessageProfileState {
  UpdateProfileState({required super.profileModel});
}
