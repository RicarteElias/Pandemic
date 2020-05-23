import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covidglobal/app/components/donut_chart/indicator.dart';
import 'package:covidglobal/app/entity/country.dart';
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
      animationDuration: Duration(seconds: 1),
      defaultRenderer: charts.ArcRendererConfig(
        arcRendererDecorators: [
          charts.ArcLabelDecorator(
            insideLabelStyleSpec: charts.TextStyleSpec(fontSize: 26,
            color: charts.MaterialPalette.white,
            fontFamily: 'Roboto',
              ),
            outsideLabelStyleSpec: charts.TextStyleSpec(fontSize: 26,
            color: charts.MaterialPalette.white,
            fontFamily: 'Roboto',
              )
            )
        ]
      ),
      behaviors: [charts.DatumLegend(
        outsideJustification: charts.OutsideJustification.endDrawArea,
        horizontalFirst: false,
        desiredMaxColumns: 1,
        cellPadding: EdgeInsets.only(bottom: 4),
        
      )],

    );
  }
  

  _generateData(){ 
    _donutData=[
      Indicator(color: Colors.red,value:DataUtils.percentIndicator(country.deaths, country.cases) ,text: "Mortos" ),
      Indicator(color: Colors.green,value: DataUtils.percentIndicator(country.recovered, country.cases),text:"Recuperados"),
      Indicator(color: Colors.blue,value:DataUtils.percentIndicator(country.active, country.cases),text: "Infectados")
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