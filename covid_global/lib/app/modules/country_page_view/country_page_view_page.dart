import 'package:flutter/material.dart';

import 'country_page_view_state.dart';

class CountryPageViewPage extends StatefulWidget {
  final String title;
  const CountryPageViewPage({Key key, this.title = "CountryPageView"})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => CountryPageViewState();
}

