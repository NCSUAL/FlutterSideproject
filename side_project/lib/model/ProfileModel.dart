import 'package:equatable/equatable.dart';

class AnswersModel extends Equatable {
  final int id;
  final String question;
  final String answer;

  const AnswersModel(
      {required this.id, required this.answer, required this.question});

  factory AnswersModel.fromJson(Map<String, dynamic> Json) => AnswersModel(
      id: Json['id'], answer: Json['answer'], question: Json['question']);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProfileModel extends Equatable {
  final int id;
  final int user;
  final int? height;
  final String nickname;
  final String job;
  final String religion;
  final bool is_smoke;
  final String drinking_frequency;
  final List<dynamic> answers;
  final List<dynamic> images;
  const ProfileModel(
      {required this.id,
      required this.user,
      required this.nickname,
      required this.answers,
      required this.drinking_frequency,
      required this.is_smoke,
      required this.job,
      required this.religion,
      this.height,
      required this.images});

  factory ProfileModel.fromJson(Map<String, dynamic> Json) => ProfileModel(
        id: Json['id'],
        user: Json['user'],
        nickname: Json['nickname'],
        answers: Json['answers'].map((e) => AnswersModel.fromJson(e)).toList(),
        drinking_frequency: Json['drinking_frequency'],
        height: Json['height'],
        is_smoke: Json['is_smoke'],
        job: Json['job'],
        religion: Json['religion'],
        images: Json['images'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
