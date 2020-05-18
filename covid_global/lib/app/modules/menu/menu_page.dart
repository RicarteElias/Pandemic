import 'package:flutter/material.dart';

import 'package:covidglobal/app/entity/country.dart';
import 'package:covidglobal/app/modules/menu/menu_state.dart';

class MenuPage extends StatefulWidget {
  List<Country> countries;
  
  MenuPage({
    Key key,
    this.countries,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => MenuState(countries: countries);
}

