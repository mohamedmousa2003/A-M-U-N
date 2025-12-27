import '../entities/flight_entity.dart';

abstract class FlightRepositoryDomain {
  Future<List<Flight>> getFlights();
}