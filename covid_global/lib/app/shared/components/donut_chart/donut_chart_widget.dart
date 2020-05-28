import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covidglobal/app/entity/country.dart';
import 'package:covidglobal/app/shared/components/donut_chart/indicator.dart';
import 'package:covidglobal/app/shared/data_ultis.dart';
import 'package:flutter/material.dart';

class DonutChart extends StatelessWidget {

  Country country;
  List<charts.Series<Indicator,String>> _series = List<charts.Series<Indicator,String>>();
  var _donutData;

  DonutChart({this.country}){
  _generateData();
}

  @override
  Widget build(BuildContext context) {
    return charts.PieChart(
      _series,
      animate: true,
      animationDuration: Duration(milliseconds:800 ),
      defaultRenderer: charts.ArcRendererConfig(
        arcRendererDecorators: [
          charts.ArcLabelDecorator(
            insideLabelStyleSpec: charts.TextStyleSpec(fontSize: 20,
            color: charts.MaterialPalette.white,
            fontFamily: 'Roboto',
              ),
            outsideLabelStyleSpec: charts.TextStyleSpec(fontSize: 20,
            color: charts.MaterialPalette.white,
            fontFamily: 'Roboto',
              )
            )
        ]
      ),behaviors: [
        charts.DatumLegend(
          desiredMaxRows: 2,
          position: charts.BehaviorPosition.top,
          cellPadding: EdgeInsets.all(2),
          outsideJustification: charts.OutsideJustification.start,
          horizontalFirst: false,
          entryTextStyle: charts.TextStyleSpec(color: charts.MaterialPalette.white,fontWeight: 'bold',fontSize: 15)
        )
      ],

    );
  }
  

  _generateData(){
    double deathValue = DataUtils.percentIndicator(country.deaths, country.cases);
    double recoveredValue = DataUtils.percentIndicator(country.recovered, country.cases);
    double activeValue = DataUtils.percentIndicator(country.active, country.cases);

    _donutData=[
      Indicator(color: Colors.red,value:deathValue ,text: "Mortos - $deathValue%" ),
      Indicator(color: Colors.green,value:recoveredValue ,text:"Recuperados - $recoveredValue%"),
      Indicator(color: Colors.blue,value:activeValue,text: "Ativos - $activeValue%")
    ];

    _series.add(
      charts.Series(
      id:"País",
      data:_donutData ,
      domainFn: (Indicator indicator,_ )=>indicator.text,
      measureFn: (Indicator indicator,_ )=>indicator.value,
      colorFn: (Indicator indicator,_ )=> charts.ColorUtil.fromDartColor(indicator.color),
      labelAccessorFn: (Indicator row,_)=>'${row.value}%',
      )
   );
  }

}