import 'package:covidglobal/app/entity/country.dart';
import 'package:covidglobal/app/shared/custom_dio.dart';
import 'package:logger/logger.dart';

class HomeRepository{

final CustomDio _client = CustomDio();
Logger logger = Logger();

Future<List<dynamic>> countrylist() async {
    
      var response = await _client.get("v2/countries?yesterday=false&allowNull=true");
      //logger.d(response.data);
      
      return (response.data as List);
    }
//curl -X GET "https://disease.sh/v2/all?yesterday=false" -H "accept: application/json"
//curl -X GET "https://disease.sh/v2/all?yesterday=1&allowNull=1" -H "accept: application/json"

}