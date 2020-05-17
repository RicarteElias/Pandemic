import 'package:json_annotation/json_annotation.dart';

part 'world.g.dart';

@JsonSerializable()

class World {
  
  int updated;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int casesPerOneMillion;
  int deathsPerOneMillion;
  int tests;
  int testsPerOneMillion;
  int affectedCountries;
  
  
  World({
    this.updated,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.affectedCountries,
  });

  factory World.fromJson(Map<String, dynamic> json) => _$WorldFromJson(json);
  Map<String, dynamic> toJson() => _$WorldToJson(this);


}
