import 'package:side_project/controller/ApiController.dart';

class Repository<T>{
  final ApiController _api_provider = new ApiController();

  Future<T> get_Datas(T category) async => await _api_provider.data_provider(category);
}