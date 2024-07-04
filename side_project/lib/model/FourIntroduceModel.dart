import 'package:equatable/equatable.dart';

class FourIntroduceModel extends Equatable {
  final int id;
  final String? nickname;
  final int age;
  final int height;
  final String? main_image;

  const FourIntroduceModel(
      {required this.id,
      this.nickname,
      required this.age,
      required this.height,
      this.main_image});

  //factory
  factory FourIntroduceModel.fromJson(Map<String, dynamic> Json) =>
      FourIntroduceModel(
        //include null
        main_image: Json["main_image"],
        nickname: Json["nickname"],

        //immutability
        id: Json["id"],
        age: Json["age"],
        height: Json["height"],
      );

  //private getter
  @override
  // TODO: implement props
  List<Object?> get props => [id, nickname, age, height, main_image];
}

class MappingFourIntroduceModel extends Equatable {
  late List<FourIntroduceModel> datas;

  MappingFourIntroduceModel.fromJson(List<dynamic> Json) {
    //initialize
    datas = List<FourIntroduceModel>.empty(growable: true);

    for (int a = 0; a < Json.length; a++) {
      datas.add(FourIntroduceModel.fromJson(Json[a]));
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [datas];
}
