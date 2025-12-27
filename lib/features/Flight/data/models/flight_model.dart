import '../../domain/entities/flight_entity.dart';

class FlightModel extends Flight {

  FlightModel({
    required super.flightNumber,
    required super.airline,
    required super.departureAirport,
    required super.arrivalAirport,
    required super.departureTime,
    super.departureActual,
    required super.arrivalTime,
    super.arrivalActual,
    required super.status,
    super.departureTerminal,
    super.departureGate,
    super.arrivalTerminal,
    super.arrivalGate,
    super.arrivalBaggage,
    super.aircraftRegistration,
    super.liveLatitude,
    super.liveLongitude,
  });

  factory FlightModel.fromJson(Map<String, dynamic> json) {
    return FlightModel(
      flightNumber: json['flight']['iata'] ?? "",
      airline: json['airline']['name'] ?? "",
      departureAirport: json['departure']['airport'] ?? "",
      arrivalAirport: json['arrival']['airport'] ?? "",
      departureTime: json['departure']['scheduled'] ?? "",
      departureActual: json['departure']['actual'],
      arrivalTime: json['arrival']['scheduled'] ?? "",
      arrivalActual: json['arrival']['actual'],
      status: json['flight_status'] ?? "",
      departureTerminal: json['departure']['terminal'],
      departureGate: json['departure']['gate'],
      arrivalTerminal: json['arrival']['terminal'],
      arrivalGate: json['arrival']['gate'],
      arrivalBaggage: json['arrival']['baggage'],
      aircraftRegistration: json['aircraft']?['registration'],
      liveLatitude: json['live']?['latitude']?.toDouble(),
      liveLongitude: json['live']?['longitude']?.toDouble(),
    );
  }
}
