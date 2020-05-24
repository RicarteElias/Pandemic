import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:covidglobal/app/entity/country.dart';
import 'package:covidglobal/app/shared/components/donut_chart/donut_chart_widget.dart';
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
            title: Text('Brasil'),
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
     return Padding(padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),child: CardCountryWidget(countries[index]),);
      }
    );

  _sliverAppBar(){
    return CustomScrollView(
      slivers: <Widget>[
    SliverAppBar(
          backgroundColor: Colors.deepPurple,
          expandedHeight: MediaQuery.of(context).size.height*0.5,
          floating: false,
          pinned: true,
          snap: false,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Estatísticas - Brasil"),
            background: Container(padding: EdgeInsets.all(40),child: DonutChart(country: _country,)),
          ),
        ),SliverFillRemaining(
          child:Center(
            child:Icon(FlutterIcons.USB_ant,size: 100,),
          ),
        )
      ],
    );
  }


 static _collorSelector(int index){
      if(index==0) { 
    return Colors.deepPurple;
      }else if(index==1){
          return Colors.deepPurple;
      }else if(index==2){
        return Colors.grey;
      }else{
        return Colors.green;
      }
       
  }

  estatisticList(){

  }


   estatiscticRow(String text,Widget valor)=> Row(
    children: <Widget>[
    Text('$text:',style: TextStyle(color: Colors.white, fontSize: 25),),Padding(padding: EdgeInsets.only(left: 5),child: 
    valor,)
    ],    );

   valueWithToday(String value, String todayValue,Color todayColor)=> Row(
    children: <Widget>[
    Text(value,style: TextStyle(color:Colors.white,fontSize: 25),),
    Icon(FlutterIcons.arrow_bold_up_ent,size: 5,color: todayColor,),
    Text(todayValue,style: TextStyle(color:todayColor,fontSize: 5),),
      ],); 

}
