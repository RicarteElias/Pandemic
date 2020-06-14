import 'package:flutter/material.dart';

class CountryListPageViewPage extends StatefulWidget {
  final String title;
  const CountryListPageViewPage({Key key, this.title = "CountryListPageView"})
      : super(key: key);

  @override
  _CountryListPageViewPageState createState() =>
      _CountryListPageViewPageState();
}

class _CountryListPageViewPageState extends State<CountryListPageViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
