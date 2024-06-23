import 'package:rxdart/rxdart.dart';
import 'package:side_project/repository/Repository.dart';
class Bloc_API<T>{
  final Repository _repository = new Repository();
  final PublishSubject<T> _publishSubject = new PublishSubject<T>();

  //타입 추출
  Stream<T> get stream => _publishSubject.stream;

  Future<void> get_Data() async{
    T get_data = await _repository.get_Datas(T);
    _publishSubject.sink.add(get_data);
  }

  dispose() {
    _publishSubject.close();
  }
}