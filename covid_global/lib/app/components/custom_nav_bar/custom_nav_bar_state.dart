import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:covidglobal/app/components/custom_nav_bar/custom_nav_bar_widget.dart';

int selectedIndex=0;
double _controllerHeight= 56;
double _controllerWidth;
bool sizeController= false;



List<NavigationItem> items=[
    
        NavigationItem(icon:Icon(MaterialIcons.flag),title: Text("Brasil") ),
        NavigationItem(icon: Icon(AntDesign.wordfile1),title: Text("Paises")),
        NavigationItem(icon: Icon(Ionicons.ios_heart),title: Text("Mundo")),
        NavigationItem(icon: Icon(Ionicons.ios_help),title: Text("Cuidados"))
        
  ]
;

Widget _buildItem(NavigationItem item, bool isSelected){
    return Row(children: <Widget>[IconTheme(data: IconThemeData(size: 26), 
    child: item.icon),
    isSelected? Padding(
      padding: const EdgeInsets.only(left: 8),
      child: item.title,
    ) : Container()],
    );
}


Widget _buildItemColumn(NavigationItem item, bool isSelected){
    return Column(children: <Widget>[IconTheme(data: IconThemeData(size: 26), 
    child: item.icon),
    isSelected? Padding(
      padding: const EdgeInsets.only(top: 10),
      child: item.title,
    ) : Container()],
    );
}


class CustomNavBarState extends State<CustomNavBarWidget>{
  @override
  Widget build(BuildContext context) {
    return  AnimatedContainer(
        duration: Duration(seconds: 1),
        padding: EdgeInsets.only(left: 8,right: 8),
        color: Colors.amber,
        height: _controllerHeight,
        width: _controllerWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
          items.map((item){
            var itemIndex =items.indexOf(item);
            return GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex = itemIndex;
                  if(itemIndex==2){
                    _controllerHeight = 0;
                    // _controllerWidth=MediaQuery.of(context).size.height*1.0;
                  }
                });
              },child: sizeController?_buildItemColumn(item, selectedIndex==itemIndex):_buildItem(item, selectedIndex==itemIndex),
            );
          }).toList()
        ,),
      );
    
  }

}

class NavigationItem {
  Icon icon;
  Text title;

  NavigationItem({
    this.icon,
    this.title,
  });
}
