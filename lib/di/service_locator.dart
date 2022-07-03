import 'package:api_exceptions_handling_flutter/data/network/api/beers_api.dart';
import 'package:api_exceptions_handling_flutter/data/network/dio_client.dart';
import 'package:api_exceptions_handling_flutter/data/repository/beers_repository.dart';
import 'package:api_exceptions_handling_flutter/ui/home/home_controller.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(BeersApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(BeersRepository(getIt.get<BeersApi>()));

  getIt.registerSingleton(HomeController());
}
