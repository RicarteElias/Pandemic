

import 'package:json_annotation/json_annotation.dart';

part 'country_info.g.dart';

@JsonSerializable()
class CountryInfo {
  int id;
  String iso2;
  String iso3;
  double lat;
  double long;
  String flag;


  CountryInfo({
    this.id,
    this.iso2,
    this.iso3,
    this.lat,
    this.long,
    this.flag,
  });

  
  factory CountryInfo.fromJson(Map<String, dynamic> json) => _$CountryInfoFromJson(json);

  
  Map<String, dynamic> toJson() => _$CountryInfoToJson(this);


}

