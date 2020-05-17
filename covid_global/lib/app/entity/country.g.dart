// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    country: json['country'] as String,
    countryInfo: (json['countryInfo'] as List)
        ?.map((e) =>
            e == null ? null : CountryInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    cases: json['cases'] as int,
    todayCases: json['todayCases'] as int,
    deaths: json['deaths'] as int,
    todayDeaths: json['todayDeaths'] as int,
    recovered: json['recovered'] as int,
    active: json['active'] as int,
    critical: json['critical'] as int,
    casesPerOneMillion: json['casesPerOneMillion'] as int,
    deathsPerOneMillion: json['deathsPerOneMillion'] as int,
    updated: json['updated'] as int,
    tests: json['tests'] as int,
    testsPerOneMillion: json['testsPerOneMillion'] as int,
    population: json['population'] as int,
    continent: json['continent'] as String,
    activePerOneMillion: json['activePerOneMillion'] as String,
    recoverPerOneMillion: json['recoverPerOneMillion'] as String,
    criticalPerOneMillion: json['criticalPerOneMillion'] as String,
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
