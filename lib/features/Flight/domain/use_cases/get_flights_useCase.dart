import '../repositories/flight_repository.dart';
import '../entities/flight_entity.dart';

class GetFlightsUseCase {
  final FlightRepositoryDomain repository;

  GetFlightsUseCase(this.repository);

  Future<List<Flight>> call() async {
    return await repository.getFlights();
  }
}