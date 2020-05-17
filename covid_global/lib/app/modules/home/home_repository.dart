import 'package:covidglobal/app/entity/country.dart';
import 'package:covidglobal/app/shared/custom_dio.dart';
import 'package:logger/logger.dart';

class HomeRepository{

final CustomDio _client = CustomDio();
Logger logger = Logger();

Future<List<Country>> countrylist() async {
    
      var response = await _client.get("v2/countries?yesterday=false&allowNull=true");
      
      return (response.data as List).map((item) => Country.fromJson(item)).toList();
    }


}