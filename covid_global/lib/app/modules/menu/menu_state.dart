import 'package:covidglobal/app/components/custom_nav_bar/custom_nav_bar_widget.dart';
import 'package:flutter/material.dart';



import 'menu_page.dart';

class MenuState extends State<MenuPage> {

  @override
  void initState() {
    super.initState();
  }

   
 

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("provisorio",)),

      bottomNavigationBar: CustomNavBarWidget(
      ),

    );
  }

}