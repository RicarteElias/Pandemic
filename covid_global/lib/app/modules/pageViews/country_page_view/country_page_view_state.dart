import 'package:covidglobal/app/entity/country.dart';
import 'package:covidglobal/app/shared/components/donut_chart/donut_chart_widget.dart';
import 'package:covidglobal/app/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'country_page_view_page.dart';

class CountryPageViewState extends State<CountryPageViewPage> {

  Country country;
  BuildContext context;

  CountryPageViewState({this.country,this.context});

  @override
  Widget build(BuildContext context) => _sliverAppBar();

_sliverAppBar(){
    return CustomScrollView(
      slivers: <Widget>[
    SliverAppBar(
          stretch: true,
          snap: true,
          backgroundColor: Constants.BACKGROUND1,
          expandedHeight: MediaQuery.of(context).size.height*0.55,
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            titlePadding: EdgeInsets.only(left: 15,bottom: 5),
            stretchModes:  <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
            title: Text("Estatísticas - ${country.country}", style: TextStyle(fontSize: 18),),
            background: Container(
              padding: EdgeInsets.only(top: 30,bottom: 40, left: 10),
              color:Constants.BACKGROUND1,
              child: DonutChart(country: country,),
            ),
          ),
        ),
        SliverFillRemaining(
          child: ListView(
          physics: NeverScrollableScrollPhysics(),  
          children: <Widget>[
          Padding(padding: EdgeInsets.only(bottom: 15,left: 15,right: 15),child:separationLine()),
          country.population==null?Container():estatiscticLine("População", value(country.population)),
          country.cases==null?Container():estatiscticLine("Total de casos", valueWithToday(country.cases, country.todayCases, Colors.red)),
          country.deaths==null?Container():estatiscticLine("Total de mortos", valueWithToday(country.deaths, country.todayDeaths, Colors.red)),
          country.recovered==null?Container(): estatiscticLine("Recuperados", value(country.recovered)),
          country.active==null?Container():estatiscticLine("Ativos", value(country.active)),
          country.tests==null?Container():estatiscticLine("Testes", value(country.tests)),
          country.casesPerOneMillion==null?Container():estatiscticLine("Casos por milhão", value(country.casesPerOneMillion.toInt())),
          country.deathsPerOneMillion==null?Container():estatiscticLine("Mortes por milhão", value(country.deathsPerOneMillion.toInt())),
          country.recoverPerOneMillion==null?Container():estatiscticLine("Recuperados por milhão", value(country.recoverPerOneMillion.toInt()))
          ],),
        )   
      ],
    );
  }

   Container separationLine(){
    return Container(
      color: Colors.grey[600],
      height: 3,
    ) ;
  }

   estatiscticLine(String text,Widget valor)=> Padding(
     padding: const EdgeInsets.only(left: 15),
     child: Column(children: <Widget>[
       Row(
      children: <Widget>[
      Text('$text:',style: TextStyle(color: Colors.white, fontSize: 18),),Padding(padding: EdgeInsets.only(left: 5),child: 
      valor,)
      ], ),
      Padding(padding: EdgeInsets.only(top:15, bottom: 15,right: 15),child: separationLine(),)
     ],)
   );

    valueWithToday(int value, int todayValue,Color todayColor)=> Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Text(value.toString(),style: TextStyle(color:Colors.white,fontSize: 18),),
    todayValue==null?Container():Icon(MaterialIcons.arrow_upward,size: 15,color: todayColor,),
    todayValue==null?Container():Text(todayValue.toString(),style: TextStyle(color:todayColor,fontSize: 10),),
      ],);

    value(int value)=> Row(
    children: <Widget>[
    Text(value.toString(),style: TextStyle(color:Colors.white,fontSize: 18),),
      ],);

}