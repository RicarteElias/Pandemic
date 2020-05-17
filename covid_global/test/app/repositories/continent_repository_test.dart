import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:covidglobal/app/repositories/continent_repository.dart';

class MockClient extends Mock implements Dio {}

void main() {
  ContinentRepository repository;
  // MockClient client;

  setUp(() {
    // repository = ContinentRepository();
    // client = MockClient();
  });

  group('ContinentRepository Test', () {
    //  test("First Test", () {
    //    expect(repository, isInstanceOf<ContinentRepository>());
    //  });

    test('returns a Post if the http call completes successfully', () async {
      //    when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
      //        .thenAnswer((_) async =>
      //            Response(data: {'title': 'Test'}, statusCode: 200));
      //    Map<String, dynamic> data = await repository.fetchPost(client);
      //    expect(data['title'], 'Test');
    });
  });
}
