import 'package:covidglobal/app/shared/custom_dio.dart';
import 'package:dio/dio.dart';

class BaseRepository {
  final Dio client = CustomDio.getInstance();

}

