import 'package:api_exceptions_handling_flutter/data/network/api/endpoints.dart';
import 'package:api_exceptions_handling_flutter/data/network/dio_client.dart';
import 'package:dio/dio.dart';

class BeersApi {
  final DioClient dioClient;

  BeersApi({required this.dioClient});

  Future<Response> getBeers() async {
    try {
      final Response response = await dioClient.get(
        Endpoints.memes,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
