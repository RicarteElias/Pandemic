// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryInfo _$CountryInfoFromJson(Map<String, dynamic> json) {
  return CountryInfo(
    id: json['id'] as int,
    iso2: json['iso2'] as String,
    iso3: json['iso3'] as String,
    lat: (json['lat'] as num)?.toDouble(),
    long: (json['long'] as num)?.toDouble(),
    flag: json['flag'] as String,
  );
}

Map<String, dynamic> _$CountryInfoToJson(CountryInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'iso2': instance.iso2,
      'iso3': instance.iso3,
      'lat': instance.lat,
      'long': instance.long,
      'flag': instance.flag,
    };
