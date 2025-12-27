

import '../../presentation/pages/aire.dart';
import '../../domain/entities/flight_entity.dart';
import '../../domain/repositories/flight_repository.dart';
import '../data_sources/remote_service.dart';
import '../models/flight_model.dart';

class FlightRepositoryImpl implements FlightRepositoryDomain {
  final AviationService service;

  FlightRepositoryImpl({required this.service});

  @override
  Future<List<Flight>> getFlights() async {
    final data = await service.getFlights();
    return data.map((json) => FlightModel.fromJson(json)).toList();
  }
}
