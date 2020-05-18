import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:covidglobal/app/entity/country.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:logger/logger.dart';
import 'package:shimmer/shimmer.dart';



import 'menu_page.dart';

class MenuState extends State<MenuPage> with SingleTickerProviderStateMixin  {
  Logger logger = Logger();
  int _currentIndex = 0;
  PageController _pageController;
  List<Country> countries;
  var currentPageValue = 0.0;

  MenuState({this.countries});

  @override
  void initState() {
    super.initState();
   _pageController = PageController();
  //  logger.d(countries);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

 

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("provisorio",)),
      body: SizedBox.expand(
        child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Container(color: Colors.blueGrey,),
            _countriesListView(),
            // Container(color: Colors.red,),
            Container(color: Colors.green,),
            Container(color: Colors.blue,),
          ],
        ),
      ),
    bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            inactiveColor: Colors.black,
            title: Text('Brasil'),
            icon: Icon(Icons.home)
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.black,
            title: Text('Países'),
            icon: Icon(MaterialIcons.flag)
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.black,
            title: Text('Mundo'),
            icon: Icon(FontAwesome.globe)
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.black,
            title: Text('Cuidados'),
            icon: Icon(RpgAwesome.health_increase)
          ),
        ],
      ),
    );
  }

  _countriesListView(){
    return new ListView.builder
  (
    itemCount: countries.length,
    itemBuilder: (BuildContext ctxt, int index) {
     return _cardCountrie(countries[index]);
      }
    );  
  }

  _cardCountrie(Country country){
    return Container(
      padding: EdgeInsets.only(left: 30,bottom: 20,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 25,
            width: 30,
            child:CachedNetworkImage(
            imageUrl: country.countryInfo.flag,
            progressIndicatorBuilder: (context, url, downloadProgress) => 
                Shimmer.fromColors(child:
                Container(
                  color: Colors.grey,
                  width: 50,
                  height: 20,
                ) 
                , baseColor:Colors.black12, highlightColor: Colors.white),
        errorWidget: (context, url, error) => Icon(Icons.error),
     ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:20.0),
            child: Text(country.country, style: TextStyle(fontSize: 20),),
          )
        ],
      ),
    );
  }
}