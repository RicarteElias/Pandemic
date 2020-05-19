import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covidglobal/app/components/donut_chart/indicator.dart';
import 'package:flutter/material.dart';

class DonutChart extends StatelessWidget {

  List<charts.Series<Indicator,String>> _series = List<charts.Series<Indicator,String>>();


DonutChart(){
  _generateData();
}

  @override
  Widget build(BuildContext context) {
    return charts.PieChart(
      _series,
      animate: true,
      animationDuration: Duration(seconds: 1),
      defaultRenderer: charts.ArcRendererConfig(
        arcWidth: 100,
        arcRendererDecorators: [
          charts.ArcLabelDecorator(
            labelPosition: charts.ArcLabelPosition.inside,
            insideLabelStyleSpec: charts.TextStyleSpec(fontSize: 25,
            color: charts.MaterialPalette.white,
            fontFamily: 'Roboto',
            fontWeight: 'bold'
              )
            )
        ]
      ),

    );
  }
  
  _corLable(){
    return charts.TextStyleSpec();
  }

  _generateData(){ 
    var donutData=[
      Indicator(color: Colors.red,value: 15.0,text: "death" ),
      Indicator(color: Colors.green,value: 25.0,text:"recuperados"),
      Indicator(color: Colors.blue,value:60,text: "Infectados")
    ];

    _series.add(
      charts.Series(
      id:"Mundo",
      data:donutData ,
      domainFn: (Indicator indicator,_ )=>indicator.text,
      measureFn: (Indicator indicator,_ )=>indicator.value,
      colorFn: (Indicator indicator,_ )=> charts.ColorUtil.fromDartColor(indicator.color),
      labelAccessorFn: (Indicator row,_)=>'${row.value}%',
      )
   );
  }
}