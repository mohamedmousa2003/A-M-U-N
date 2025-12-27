import 'package:amun/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:amun/features/home/data/models/classical_model.dart';
import 'package:amun/features/home/data/models/hotel_model.dart';
import 'package:amun/features/home/data/models/riviera_model.dart';
import 'package:dio/dio.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/api/status_codes.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{
  final dio = Dio();
  @override
  Future<List<ClassicalModel>> getClassicalHighlights() async{
    try {
      final response = await dio.get(EndPoints.classical);
      if (response.statusCode == StatusCodes.success) {
        final List data = response.data;
        return data.map((json) => ClassicalModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch classical highlights: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error fetching classical highlights: $e');
    }
  }


  @override
  Future<List<HotelModel>> getHotels() async{

    try {
      final response = await dio.get(EndPoints.hotel);
      if (response.statusCode == StatusCodes.success) {
        final List data = response.data;
        return data.map((json) => HotelModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch classical highlights: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error fetching classical highlights: $e');
    }
  }


  @override
  Future<List<TouristPlace>> getRivieraHighlights() async{
    try {
      final response = await dio.get(EndPoints.tourist);
      if (response.statusCode == StatusCodes.success) {
        final List data = response.data;
        return data.map((json) => TouristPlace.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch classical highlights: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error fetching classical highlights: $e');
    }

  }


}