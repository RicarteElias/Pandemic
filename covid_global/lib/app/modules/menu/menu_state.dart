import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:covidglobal/app/entity/country.dart';
import 'package:covidglobal/app/shared/components/donut_chart/donut_chart_widget.dart';
import 'package:covidglobal/app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:logger/logger.dart';
import 'Components/card_country/card_country_widget.dart';
import 'menu_page.dart';

class MenuState extends State<MenuPage> with SingleTickerProviderStateMixin  {
  static Logger logger = Logger();
  static int _currentIndex = 0;
  PageController _pageController;
  List<Country> countries;
  var currentPageValue = 0.0;
  static Color _backgroundColorController = _collorSelector(0);
  Country _country;

  MenuState({this.countries}){
      this._country = countries.firstWhere((element) => element.country == 'Brazil');
    logger.i(_country.toJson());
      
  }

  @override
  void initState() {
    super.initState();
   _pageController = PageController(); 
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child:AnimatedContainer(
          duration: Duration(milliseconds: 600),
          color: _backgroundColorController,
          child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
                _backgroundColorController = _collorSelector(index);
              });
            },
            children: <Widget>[
              _sliverAppBar(),
              __countriesListView(),
              DonutChart(country: _country,),
              Center(child: Icon(FlutterIcons.USB_ant,size: 100,),),
            ],
          ),
        ),
      ),
    bottomNavigationBar: BottomNavyBar(
      showElevation: true,
      
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          _pageController.jumpToPage(index); 
          setState(() => _currentIndex = index);
           
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            inactiveColor: Colors.black,
            activeColor: _backgroundColorController,
            title: Text(_country.country),
            icon: Icon(Icons.home)
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.black,
            activeColor: _backgroundColorController,
            title: Text('Países'),
            icon: Icon(MaterialIcons.flag)
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.black,
            activeColor: _backgroundColorController,
            title: Text('Mundo'),
            icon: Icon(FontAwesome.globe)
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.black,
            activeColor: _backgroundColorController,
            title: Text('Cuidados'),
            icon: Icon(RpgAwesome.health_increase,)
          ),
        ],
      ),
    );
  }

  __countriesListView()=> Column(children: <Widget>[
    Container(
      height:70,
      width: MediaQuery.of(context).size.height* 1.0,
      child: Text("lista de países"),),
    Expanded(child: _countriesList(),)
    ],);
  _countriesList()=> ListView.builder
  (
    itemCount: countries.length,
    itemBuilder: (BuildContext ctxt, int index) {
     return Padding(padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),child: GestureDetector(
       onTap:()=>_selectCountry(countries[index]),
       child:countries[index].population==null?Container():CardCountryWidget(countries[index])),
       );
      }
    );

  _sliverAppBar(){
    return CustomScrollView(
      slivers: <Widget>[
    SliverAppBar(
             textTheme:TextTheme(headline1: TextStyle(fontSize: 30)) ,
          stretch: true,
          snap: true,
          backgroundColor: Constants.BACKGROUND1,
          expandedHeight: MediaQuery.of(context).size.height*0.5,
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
            title: Text("Estatísticas - ${_country.country}", style: TextStyle(fontSize: 22),),
            background: Container(padding: EdgeInsets.all(40),child: DonutChart(country: _country,)),
          ),
        ),
        SliverFillRemaining(
          child: ListView(
          physics: NeverScrollableScrollPhysics(),  
          children: <Widget>[
          Padding(padding: EdgeInsets.only(bottom: 15,left: 15,right: 15),child:separationLine()),
          estatiscticLine("População", value(_country.population)),
          estatiscticLine("Total de casos", valueWithToday(_country.cases, _country.todayCases, Colors.red)),
          estatiscticLine("Total de mortos", valueWithToday(_country.deaths, _country.todayDeaths, Colors.red)),
          estatiscticLine("Recuperados", value(_country.recovered)),
          estatiscticLine("Ativos", value(_country.active)),
          estatiscticLine("Testes", value(_country.tests)),
          estatiscticLine("Casos por milhão", value(_country.casesPerOneMillion.toInt())),
          estatiscticLine("Mortes por milhão", value(_country.deathsPerOneMillion.toInt())),
          _country.recoverPerOneMillion==null?Container():estatiscticLine("Recuperados por milhão", value(_country.recoverPerOneMillion.toInt()))
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
      Text('$text:',style: TextStyle(color: Colors.white, fontSize: 25),),Padding(padding: EdgeInsets.only(left: 5),child: 
      valor,)
      ], ),
      Padding(padding: EdgeInsets.only(top:15, bottom: 15,right: 15),child: separationLine(),)
     ],)
   );

    valueWithToday(int value, int todayValue,Color todayColor)=> Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Text(value.toString(),style: TextStyle(color:Colors.white,fontSize: 28),),
    todayValue==null?Container():Icon(MaterialIcons.arrow_upward,size: 15,color: todayColor,),
    todayValue==null?Container():Text(todayValue.toString(),style: TextStyle(color:todayColor,fontSize: 15),),
      ],);

   void _selectCountry(Country country){
      _country = country;
      logger.wtf(_country.toJson());
      _pageController.jumpToPage(0);
   }


    value(int value)=> Row(
    children: <Widget>[
    Text(value.toString(),style: TextStyle(color:Colors.white,fontSize: 28),),
      ],);

      static _collorSelector(int index){
      if(index==0 || index==1) { 
          return Constants.BACKGROUND1;
      }else if(index==2){
          return Colors.grey;
      }else{
          return Colors.green;
      }       
  }

}
