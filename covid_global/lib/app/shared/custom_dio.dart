import 'package:dio/dio.dart';

class CustomDio {

  CustomDio._();

  static Dio _dio;

  static Dio getInstance(){
    if(_dio==null){
      _dio= new Dio();
      _dio.options.baseUrl="https://disease.sh/";
      _dio.options.connectTimeout = 5000; //5s
      _dio.options.receiveTimeout = 3000;
      return _dio;
    }
    else{
      return _dio;
    }
  }
}



 // CustomDio(){
  //   options.baseUrl="https://disease.sh/";
  // }
