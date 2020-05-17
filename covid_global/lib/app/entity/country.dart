

import 'package:covidglobal/app/entity/country_info.dart';
import 'package:json_annotation/json_annotation.dart';


part 'country.g.dart';

@JsonSerializable()
class Country {

String country;
CountryInfo countryInfo;
int cases;
int todayCases;
int deaths;	
int todayDeaths;	
int recovered;	
int active;	
int critical;	
int casesPerOneMillion;	
int deathsPerOneMillion;
int updated;
int tests;
int testsPerOneMillion;
int population;
String continent;
String activePerOneMillion;
String recoverPerOneMillion;
String criticalPerOneMillion;


  Country({
    this.country,
    this.countryInfo,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.updated,
    this.tests,
    this.testsPerOneMillion,
    this.population,
    this.continent,
    this.activePerOneMillion,
    this.recoverPerOneMillion,
    this.criticalPerOneMillion,
  });

factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);


Map<String, dynamic> toJson() => _$CountryToJson(this);

}
