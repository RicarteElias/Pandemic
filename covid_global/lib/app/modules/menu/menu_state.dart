import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:covidglobal/app/entity/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:logger/logger.dart';
import 'package:shimmer/shimmer.dart';
import 'menu_page.dart';

class MenuState extends State<MenuPage> with SingleTickerProviderStateMixin  {
  static Logger logger = Logger();
  static int _currentIndex = 0;
  PageController _pageController;
  List<Country> countries;
  var currentPageValue = 0.0;
  static Color _backgroundColorController = _collorSelector(0);

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
              Center(child: Icon(FlutterIcons.Trophy_ant,size: 100,),),
              _countriesListView(),
              Center(child: Icon(FlutterIcons.API_ant,size: 100,),),
              Center(child: Icon(FlutterIcons.USB_ant,size: 100,),),
            ],
          ),
        ),
      ),
    bottomNavigationBar: BottomNavyBar(
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

  _countriesListView(){
    return new ListView.builder
  (
    itemCount: countries.length,
    itemBuilder: (BuildContext ctxt, int index) {
     return Padding(padding: EdgeInsets.only(left: 10,top:10,right: 10,bottom: 10),child: _cardCountry(countries[index]),);
      }
    );  
  }

  _cardCountry(Country country){
    return Container(
      height: 50,
      alignment: Alignment.center ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
              boxShadow:[BoxShadow(
                blurRadius: 10,
                color: Colors.black26,
              )]
            ),
      padding: EdgeInsets.only(left: 30,right: 10),
      child: Center(
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
      ),
    );
  }

 static _collorSelector(int index){
      if(index==0) { 
    return Colors.amber;
      }else if(index==1){
          return Colors.red;
      }else if(index==2){
        return Colors.blue;
      }else{
        return Colors.green;
      }
       
  }

}