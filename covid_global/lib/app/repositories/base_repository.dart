import 'package:covidglobal/app/shared/custom_dio.dart';
import 'package:flutter_modular/flutter_modular.dart' show Disposable;

class BaseRepository extends Disposable {
  final CustomDio client = CustomDio();

  //dispose will be called automatically
  @override
  void dispose() {}
}