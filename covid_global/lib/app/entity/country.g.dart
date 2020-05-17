// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    country: json['country'] as String,
    countryInfo: json['countryInfo'] == null
        ? null
        : CountryInfo.fromJson(json['countryInfo'] as Map<String, dynamic>),
    cases: json['cases'] as int,
    todayCases: json['todayCases'] as int,
    deaths: json['deaths'] as int,
    todayDeaths: json['todayDeaths'] as int,
    recovered: json['recovered'] as int,
    active: json['active'] as int,
    critical: json['critical'] as int,
    casesPerOneMillion: (json['casesPerOneMillion'] as num)?.toDouble(),
    deathsPerOneMillion: (json['deathsPerOneMillion'] as num)?.toDouble(),
    updated: json['updated'] as int,
    tests: json['tests'] as int,
    testsPerOneMillion: json['testsPerOneMillion'] as int,
    population: json['population'] as int,
    continent: json['continent'] as String,
    activePerOneMillion: (json['activePerOneMillion'] as num)?.toDouble(),
    recoverPerOneMillion: (json['recoverPerOneMillion'] as num)?.toDouble(),
    criticalPerOneMillion: (json['criticalPerOneMillion'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'country': instance.country,
      'countryInfo': instance.countryInfo,
      'cases': instance.cases,
      'todayCases': instance.todayCases,
      'deaths': instance.deaths,
      'todayDeaths': instance.todayDeaths,
      'recovered': instance.recovered,
      'active': instance.active,
      'critical': instance.critical,
      'casesPerOneMillion': instance.casesPerOneMillion,
      'deathsPerOneMillion': instance.deathsPerOneMillion,
      'updated': instance.updated,
      'tests': instance.tests,
      'testsPerOneMillion': instance.testsPerOneMillion,
      'population': instance.population,
      'continent': instance.continent,
      'activePerOneMillion': instance.activePerOneMillion,
      'recoverPerOneMillion': instance.recoverPerOneMillion,
      'criticalPerOneMillion': instance.criticalPerOneMillion,
    };
