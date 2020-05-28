import 'package:covidglobal/app/repositories/country_repository.dart';
import 'package:covidglobal/app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:logger/logger.dart';
import 'home_page.dart';

class HomeState extends State<HomePage> with TickerProviderStateMixin {


    Logger logger= Logger();  
    AnimationController _controller;
    Animation<double> _animation;
    CountryRepository _countryRepository = CountryRepository()
    ;
    
  
    initState() {
      super.initState();
      _controller = AnimationController(
          duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);
      _animation = CurvedAnimation(parent: _controller, curve: Curves.ease);
        _controller.forward();

    _countryRepository.countryList().then((countries){
      Navigator.pushReplacementNamed(context, '/menu', arguments: countries);
    });
        
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
              color: Constants.BACKGROUND1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                ScaleTransition(
                  scale: _animation,
                  alignment: Alignment.center,
                  child: 
                  Image.asset(Constants.ICON,height: MediaQuery.of(context).size.height*0.15,)
                  ),Padding(
                    padding: const EdgeInsets.only(top:100.0),
                    child: SpinKitWave(size: 26,
                      color: Colors.white
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Carregando informações",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, fontStyle: FontStyle.italic,color: Colors.white),),
                  )
              ],)
          ),
      );
    }
  }

