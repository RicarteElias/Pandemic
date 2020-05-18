import 'package:covidglobal/app/modules/home/home_bloc.dart';
import 'package:covidglobal/app/modules/menu/menu_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:covidglobal/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeBloc()),
       
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router("/menu", child: (_,args)=>MenuPage(countries: args.data,),transition: TransitionType.scale)
      ];

  static Inject get to => Inject<HomeModule>.of();
}
