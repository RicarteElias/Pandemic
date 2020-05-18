import 'package:covidglobal/app/modules/menu/menu_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MenuModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i)=>MenuPage()),
  ];

  @override
  List<Router> get routers => [
    Router(Modular.initialRoute, child: (_, args) => MenuPage(countries: args.data,)),
  ];

  static Inject get to => Inject<MenuModule>.of();
}
