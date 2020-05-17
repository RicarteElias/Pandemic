import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:covidglobal/app/components/custom_nav_bar/custom_nav_bar_widget.dart';

int index;
List<NavigationItem> items=[
    
        NavigationItem(icon:Icon(MaterialIcons.flag),title: Text("Brasil") ),
        NavigationItem(icon: Icon(AntDesign.wordfile1),title: Text("Paises")),
        NavigationItem(icon: Icon(Ionicons.ios_heart),title: Text("Mundo")),
        NavigationItem(icon: Icon(Ionicons.ios_help),title: Text("Cuidados"))
        
  ]
;

Widget _buildItem(NavigationItem item, bool isSelected){
    return Row(children: <Widget>[item.icon,item.title],
    );
}



class CustomNavBarState extends State<CustomNavBarWidget>{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8,right: 8),
      color: Colors.amber,
      height: 56,
      width: MediaQuery.of(context).size.height* 1.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
        items.map((item){
          return _buildItem(item, false);
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
