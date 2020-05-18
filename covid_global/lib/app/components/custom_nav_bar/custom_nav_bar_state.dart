import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:covidglobal/app/components/custom_nav_bar/custom_nav_bar_widget.dart';

int selectedIndex=0;

List<NavigationItem> items=[
    
        NavigationItem(icon:Icon(MaterialIcons.flag),title: Text("Brasil"),color: Colors.green),
        NavigationItem(icon: Icon(MaterialIcons.flag),title: Text("Paises"),color: Colors.indigo),
        NavigationItem(icon: Icon(FontAwesome.globe),title: Text("Mundo"),color: Colors.red),
        NavigationItem(icon: Icon(Ionicons.ios_help),title: Text("Cuidados"),color: Colors.greenAccent)
        
  ]
;

Widget _buildItem(NavigationItem item, bool isSelected){
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      width: isSelected?120:50,
      height: double.maxFinite,
      padding: EdgeInsets.only(left:16),
      decoration: isSelected?BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        color: item.color
      ):null,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[IconTheme(data: IconThemeData(size: 26,
      color: isSelected?Colors.white:Colors.black), 
      child: item.icon),
      isSelected? Padding(
        padding: const EdgeInsets.only(left: 8),
        child: isSelected?DefaultTextStyle.merge(child:item.title ,style: TextStyle(color: Colors.white)):item.title,
      ) : Container()],
      ),
        ],
      )
    );
}




class CustomNavBarState extends State<CustomNavBarWidget>{
  @override
  Widget build(BuildContext context) {
    
    return  AnimatedContainer(
        duration: Duration(seconds: 2 ),
        padding: EdgeInsets.only(left: 8,top:5,bottom: 5, right: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          )]
        ),
        height: 56,//MediaQuery.of(context).size.height*1.0,
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
          items.map((item){
            var itemIndex =items.indexOf(item);
            return GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex = itemIndex;
                });
              },child: _buildItem(item, selectedIndex==itemIndex),
            );
          }).toList()
        ,),
      );
    
  }
}

class NavigationItem {
  Icon icon;
  Text title;
  Color color;

  NavigationItem({
    this.icon,
    this.title,
    this.color,
  });
}
