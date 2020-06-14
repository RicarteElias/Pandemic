import 'package:covidglobal/app/modules/pageViews/country_list_page_view/country_list_page_view_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:covidglobal/app/modules/pageViews/country_list_page_view/country_list_page_view_page.dart';

class CountryListPageViewModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CountryListPageViewBloc()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => CountryListPageViewPage()),
      ];

  static Inject get to => Inject<CountryListPageViewModule>.of();
}
