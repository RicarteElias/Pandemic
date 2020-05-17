import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:covidglobal/app/app_module.dart';
import 'package:covidglobal/app/modules/menu/menu_bloc.dart';
import 'package:covidglobal/app/app_module.dart';

void main() {
  Modular.init(AppModule());
  Modular.bindModule(AppModule());
  MenuBloc bloc;

  // setUp(() {
  //     bloc = AppModule.to.get<MenuBloc>();
  // });

  // group('MenuBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<MenuBloc>());
  //   });
  // });
}
