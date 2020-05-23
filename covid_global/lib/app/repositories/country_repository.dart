import 'package:covidglobal/app/entity/country.dart';
import 'package:covidglobal/app/repositories/base_repository.dart';

class CountryRepository extends BaseRepository {
  
Future<List<Country>> countryList() async {
    
      var response = await this.client.get("v2/countries?yesterday=false&allowNull=true");
      return (response.data as List).map((item) => Country.fromJson(item)).toList();
    }
  @override
  void dispose() {}
}
