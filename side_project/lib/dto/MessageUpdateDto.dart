import 'package:equatable/equatable.dart';

class MessageUpdateDto extends Equatable {
  final String content;
  final String status;
  final int id;

  const MessageUpdateDto(
      {required this.id, required this.status, required this.content});
  @override
  // TODO: implement props
  List<Object?> get props => [content, status, id];
}
