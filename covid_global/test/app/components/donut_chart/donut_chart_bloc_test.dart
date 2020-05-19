import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:covidglobal/app/app_module.dart';
import 'package:covidglobal/app/components/donut_chart/donut_chart_bloc.dart';
import 'package:covidglobal/app/app_module.dart';

void main() {
  Modular.init(AppModule());
  Modular.bindModule(AppModule());
  DonutChartBloc bloc;

  // setUp(() {
  //     bloc = AppModule.to.get<DonutChartBloc>();
  // });

  // group('DonutChartBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<DonutChartBloc>());
  //   });
  // });
}
