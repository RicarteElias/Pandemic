import 'package:covidglobal/app/components/custom_nav_bar/custom_nav_bar_bloc.dart';
import 'package:covidglobal/app/repositories/base_repository.dart';
import 'package:covidglobal/app/repositories/continent_repository.dart';
import 'package:covidglobal/app/repositories/world_repository.dart';
import 'package:covidglobal/app/repositories/country_repository.dart';
import 'package:covidglobal/app/modules/menu/menu_bloc.dart';
import 'package:covidglobal/app/app_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:covidglobal/app/app_widget.dart';
import 'package:covidglobal/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CustomNavBarBloc()),
        Bind((i) => BaseRepository()),
        Bind((i) => ContinentRepository()),
        Bind((i) => WorldRepository()),
        Bind((i) => CountryRepository()),
        Bind((i) => MenuBloc()),
        Bind((i) => AppBloc()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
