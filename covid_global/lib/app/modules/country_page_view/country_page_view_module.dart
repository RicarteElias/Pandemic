import 'package:covidglobal/app/modules/country_page_view/country_page_view_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:covidglobal/app/modules/country_page_view/country_page_view_page.dart';

class CountryPageViewModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CountryPageViewBloc()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => CountryPageViewPage()),
      ];

  static Inject get to => Inject<CountryPageViewModule>.of();
}
