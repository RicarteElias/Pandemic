import 'package:covidglobal/app/repositories/base_repository.dart';
import 'package:dio/dio.dart';

class WorldRepository extends BaseRepository {


  Future fetchPost(Dio client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
