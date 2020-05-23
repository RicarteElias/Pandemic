import 'package:covidglobal/app/shared/custom_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart' show Disposable;

class BaseRepository extends Disposable {
  final Dio client = CustomDio.getInstance();

  @override
  void dispose() {}
}
