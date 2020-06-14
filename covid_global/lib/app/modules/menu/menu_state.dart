import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:covidglobal/app/entity/country.dart';
import 'package:covidglobal/app/modules/pageViews/country_page_view/country_page_view_page.dart';
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
              CountryPageViewPage(country:_country,context: context,),
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
     return countries[index].deaths==null||countries[index].active==null||countries[index].recovered==null?
       Container():Padding(padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),child: GestureDetector(
       onTap:()=>_selectCountry(countries[index]),
       child:CardCountryWidget(countries[index])),
       );
      }
    );

  

   void _selectCountry(Country country){
      _country = country;
      _pageController.jumpToPage(0);
   }


    value(int value)=> Row(
    children: <Widget>[
    Text(value.toString(),style: TextStyle(color:Colors.white,fontSize: 18),),
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
