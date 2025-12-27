import 'package:amun/features/trip/data/data_sources/remote/trip_remote_data_source.dart';
import 'package:dio/dio.dart';

import '../../../../../core/api/status_codes.dart';
import '../../models/TripModel.dart';

class TripRepositorySourceImpl implements TripRemoteDataSource {
  final dio = Dio();

  @override
  Future<TripModel> getTripPlan({ int numberOfDays=0,  double budget=0}) async {
    try {
      final response = await dio.post(
        'http://tourism1.runasp.net/plan_trip',
        data: {
          "days": numberOfDays,
          "budget": budget,
        },
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      if (response.statusCode == StatusCodes.success) {
        final tripModel = TripModel.fromJson(response.data);
        return tripModel;
      } else {
        throw Exception('Failed to create trip: ${response.statusMessage}');
      }
    } catch (e) {
  throw Exception('Error to create trip: $e');
  }
  }
}
