import 'package:flutter/material.dart';

import 'package:covidglobal/app/entity/country.dart';
import 'package:covidglobal/app/modules/menu/menu_state.dart';

class MenuPage extends StatefulWidget {
  final List<Country> countries;
  final Country brazil;
  
  MenuPage({
    Key key,
    this.countries,
    this.brazil
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => MenuState(countries: countries);
}

