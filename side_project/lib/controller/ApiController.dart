import 'dart:convert';

import 'package:side_project/api/Request_Api.dart';
import 'package:side_project/bloc/DailyFourIntroduceBloc.dart';
import 'package:side_project/bloc/OtherProfilesBloc.dart';
import 'package:side_project/bloc/ReceivedMessageBloc.dart';
import 'package:dio/dio.dart';
import 'package:side_project/dto/MessageUpdateDto.dart';
import 'package:side_project/bloc/MyProfilesBloc.dart';
import 'package:side_project/bloc/SentMessageBloc.dart';

class ApiController<T> extends Request_Api {
  late Response _response;
  static const String _messageRecived = 'message/received/';
  static const String _todayProfiles = 'profiles/today/';
  static const String _messageRefuse = 'message/';
  static const String _messageSent = 'message/sent/';
  static const String _profile = 'profiles/';
  static const String _myprofile = 'profiles/my/';
  MessageUpdateDto? refuseDto;
  int? id;
  ApiController({this.refuseDto, this.id});

  Future<Response> apiCategorize() async {
    switch (T) {
      case ReceivedMessageLoadEvent:
        //받은 메세지
        _response = await get_Request(_messageRecived);
        return _response;

      case LoadMyProfileEvent:
        //내 프로필
        _response = await get_Request(_myprofile);
        return _response;

      case LoadOtherProfilesEvent:
        //프로필 조회
        _response = await get_Request_Include_param(_profile, id!);
        return _response;

      case SentMessageLoadEvent:
        //보낸 메세지
        _response = await get_Request(_messageSent);
        return _response;

      case ReceivedMessagedRefuseEvent:
        Map<String, dynamic> body = {
          "content": "${refuseDto!.content}",
          "status": "refused"
        };
        //거절 이벤트
        _response = await patch_Request(_messageRefuse, body, refuseDto!.id);
        return _response;

      case DailyFourIntroduceBloc:
        //4명씩 소개
        _response = await get_Request(_todayProfiles);
        return _response;

      default:
        throw Exception("예기치 못한 오류");
    }
  }
}
