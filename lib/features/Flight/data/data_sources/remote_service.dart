import 'package:dio/dio.dart';

class AviationService {
  final Dio _dio = Dio();
  final String _baseUrl = "http://api.aviationstack.com/v1";
  final String _apiKey = "71263ca391dc7c511f4266f50a28419d";

  Future<List<Map<String, dynamic>>> getFlights({String? flightNumber}) async {
    final response = await _dio.get(
      "$_baseUrl/flights",
      queryParameters: {
        "access_key": _apiKey,
        if (flightNumber != null) "flight_iata": flightNumber,
      },
    );
    final data = response.data['data'] as List;
    return data.map((e) => e as Map<String, dynamic>).toList();
  }
}
