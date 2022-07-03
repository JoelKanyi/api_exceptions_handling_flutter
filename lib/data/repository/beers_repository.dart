import 'package:api_exceptions_handling_flutter/data/models/beers_model.dart';
import 'package:api_exceptions_handling_flutter/data/network/api/beers_api.dart';
import 'package:api_exceptions_handling_flutter/data/network/dio_exception.dart';
import 'package:dio/dio.dart';

class BeersRepository {
  final BeersApi beersApi;

  BeersRepository(this.beersApi);

  Future<List<Beer>> getBeers() async {
    try {
      final response = await beersApi.getBeers();
      final beers =
          (response.data as List).map((e) => Beer.fromJson(e)).toList();

      return beers;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
