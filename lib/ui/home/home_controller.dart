import 'package:api_exceptions_handling_flutter/data/models/beers_model.dart';
import 'package:api_exceptions_handling_flutter/data/repository/beers_repository.dart';
import 'package:api_exceptions_handling_flutter/di/service_locator.dart';

class HomeController {
  final beersRepository = getIt.get<BeersRepository>();
  final List<Beer> beers = [];

  Future<List<Beer>> getBeers() async {
    final beers = await beersRepository.getBeers();
    return beers;
  }
}
