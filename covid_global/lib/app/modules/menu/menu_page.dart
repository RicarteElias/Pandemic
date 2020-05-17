import 'package:covidglobal/app/modules/menu/menu_state.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  final String title;
  const MenuPage({Key key, this.title = "Menu"}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MenuState();
}

