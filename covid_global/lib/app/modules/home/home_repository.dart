import 'package:covidglobal/app/entity/country.dart';
import 'package:covidglobal/app/shared/custom_dio.dart';
import 'package:logger/logger.dart';

class HomeRepository{

final CustomDio _client = CustomDio();
Logger logger = Logger();

Future<List<Country>> countrylist() async {
    
      var response = await _client.get("v2/all", queryParameters: {"yesterday":false,"allowNull":false});

      logger.d(response);
        //return (response as List).map((item) => Country.fromJson(item)).toList() ;
       
    }
//curl -X GET "https://disease.sh/v2/all?yesterday=false" -H "accept: application/json"
//curl -X GET "https://disease.sh/v2/all?yesterday=1&allowNull=1" -H "accept: application/json"

}