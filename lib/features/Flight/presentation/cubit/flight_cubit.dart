import 'package:bloc/bloc.dart';

import '../pages/aire.dart';
import '../../domain/use_cases/get_flights_useCase.dart';
import 'flight_state.dart';

class FlightCubit extends Cubit<FlightState> {
  final GetFlightsUseCase getFlightsUseCase;

  FlightCubit({required this.getFlightsUseCase}) : super(FlightInitial());

  Future<void> fetchFlights() async {
    emit(FlightLoading());
    try {
      final flights = await getFlightsUseCase();
      emit(FlightLoaded(flights: flights));
    } catch (e) {
      emit(FlightError(message: e.toString()));
    }
  }
}
