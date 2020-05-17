
import 'package:covidglobal/app/entity/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:logger/logger.dart';

import 'home_page.dart';
import 'home_repository.dart';

class HomeState extends State<HomePage> with TickerProviderStateMixin {


    Logger logger= Logger();  
    AnimationController _controller;
    Animation<double> _animation;
    HomeRepository _homeRepository = HomeRepository();
  
    initState() {
      super.initState();
      _controller = AnimationController(
          duration: const Duration(milliseconds: 3000), vsync: this, value: 0.1);
      _animation = CurvedAnimation(parent: _controller, curve: Curves.ease);
  
      _controller.forward();

      _homeRepository.countrylist().then((value){ 

        _controller.reverse();

        Country teste = value.firstWhere((element) => element.country == "Albania");
        logger.d(
         teste.continent);
            }
        );
  

      
      
    }
  
    @override
    dispose() {
      _controller.dispose();
      super.dispose();
    }
  
    Widget build(BuildContext context) {
  
      return Scaffold(
              body: 
              Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                ScaleTransition(
                  scale: _animation,
                  alignment: Alignment.center,
                  child: Icon(Icons.check, size: 200.0,color: Colors.green)
                  ),SpinKitWave(
                    color: Colors.indigo,
                  )
              ],)
          ),
      );
    }
  }

