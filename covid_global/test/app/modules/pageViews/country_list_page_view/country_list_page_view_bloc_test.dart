import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:covidglobal/app/app_module.dart';
import 'package:covidglobal/app/modules/pageViews/country_list_page_view/country_list_page_view_bloc.dart';
import 'package:covidglobal/app/modules/pageViews/country_list_page_view/country_list_page_view_module.dart';

void main() {
  Modular.init(AppModule());
  Modular.bindModule(CountryListPageViewModule());
  CountryListPageViewBloc bloc;

  // setUp(() {
  //     bloc = CountryListPageViewModule.to.get<CountryListPageViewBloc>();
  // });

  // group('CountryListPageViewBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<CountryListPageViewBloc>());
  //   });
  // });
}
