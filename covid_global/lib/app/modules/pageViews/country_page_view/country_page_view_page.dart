import 'package:flutter/material.dart';

import 'package:covidglobal/app/entity/country.dart';

import 'country_page_view_state.dart';

class CountryPageViewPage extends StatefulWidget {
  
final Country country;
final BuildContext context;
  const CountryPageViewPage({
    this.context,
    Key key,
    this.country,
  }) : super(key: key);



  @override
  State<StatefulWidget> createState() => CountryPageViewState(country: this.country,context: this.context);
}

