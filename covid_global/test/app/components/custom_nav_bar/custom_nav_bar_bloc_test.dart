import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:covidglobal/app/app_module.dart';
import 'package:covidglobal/app/components/custom_nav_bar/custom_nav_bar_bloc.dart';
import 'package:covidglobal/app/app_module.dart';

void main() {
  Modular.init(AppModule());
  Modular.bindModule(AppModule());
  CustomNavBarBloc bloc;

  // setUp(() {
  //     bloc = AppModule.to.get<CustomNavBarBloc>();
  // });

  // group('CustomNavBarBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<CustomNavBarBloc>());
  //   });
  // });
}
