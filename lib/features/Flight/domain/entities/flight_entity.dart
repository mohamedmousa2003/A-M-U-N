class Flight {
  final String flightNumber;
  final String airline;
  final String departureAirport;
  final String arrivalAirport;
  final String departureTime;
  final String? departureActual;
  final String arrivalTime;
  final String? arrivalActual;
  final String status;
  final String? departureTerminal;
  final String? departureGate;
  final String? arrivalTerminal;
  final String? arrivalGate;
  final String? arrivalBaggage;
  final String? aircraftRegistration;
  final double? liveLatitude;
  final double? liveLongitude;

  Flight({
    required this.flightNumber,
    required this.airline,
    required this.departureAirport,
    required this.arrivalAirport,
    required this.departureTime,
    this.departureActual,
    required this.arrivalTime,
    this.arrivalActual,
    required this.status,
    this.departureTerminal,
    this.departureGate,
    this.arrivalTerminal,
    this.arrivalGate,
    this.arrivalBaggage,
    this.aircraftRegistration,
    this.liveLatitude,
    this.liveLongitude,
  });
}
