// ================= Aviation Service =================
import 'package:amun/core/utils/app_colors.dart';
import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../data/data_sources/remote_service.dart';
import '../../data/repositories/flight_repository_impl.dart';
import '../../domain/entities/flight_entity.dart';
import '../../domain/use_cases/get_flights_useCase.dart';
import '../cubit/flight_cubit.dart';
import '../cubit/flight_state.dart';
// class AviationService {
//   final Dio _dio = Dio();
//   final String _baseUrl = "http://api.aviationstack.com/v1";
//   final String _apiKey = "71263ca391dc7c511f4266f50a28419d";
//
//   Future<List<Map<String, dynamic>>> getFlights({String? flightNumber}) async {
//     try {
//       final response = await _dio.get(
//         "$_baseUrl/flights",
//         queryParameters: {
//           "access_key": _apiKey,
//           if (flightNumber != null) "flight_iata": flightNumber,
//         },
//       );
//       final data = response.data['data'] as List;
//       return data.map((e) => e as Map<String, dynamic>).toList();
//     } catch (e) {
//       throw Exception("Failed to fetch flights: $e");
//     }
//   }
// }
//
// // ================= Flight Model =================
// class FlightModel {
//   final String flightNumber;
//   final String airline;
//   final String departureAirport;
//   final String arrivalAirport;
//   final String departureTime;
//   final String? departureActual;
//   final String arrivalTime;
//   final String? arrivalActual;
//   final String status;
//   final String? departureTerminal;
//   final String? departureGate;
//   final String? arrivalTerminal;
//   final String? arrivalGate;
//   final String? arrivalBaggage;
//   final String? aircraftRegistration;
//   final double? liveLatitude;
//   final double? liveLongitude;
//
//   FlightModel({
//     required this.flightNumber,
//     required this.airline,
//     required this.departureAirport,
//     required this.arrivalAirport,
//     required this.departureTime,
//     this.departureActual,
//     required this.arrivalTime,
//     this.arrivalActual,
//     required this.status,
//     this.departureTerminal,
//     this.departureGate,
//     this.arrivalTerminal,
//     this.arrivalGate,
//     this.arrivalBaggage,
//     this.aircraftRegistration,
//     this.liveLatitude,
//     this.liveLongitude,
//   });
//
//   factory FlightModel.fromJson(Map<String, dynamic> json) {
//     return FlightModel(
//       flightNumber: json['flight']['iata'] ?? "",
//       airline: json['airline']['name'] ?? "",
//       departureAirport: json['departure']['airport'] ?? "",
//       arrivalAirport: json['arrival']['airport'] ?? "",
//       departureTime: json['departure']['scheduled'] ?? "",
//       departureActual: json['departure']['actual'],
//       arrivalTime: json['arrival']['scheduled'] ?? "",
//       arrivalActual: json['arrival']['actual'],
//       status: json['flight_status'] ?? "",
//       departureTerminal: json['departure']['terminal'],
//       departureGate: json['departure']['gate'],
//       arrivalTerminal: json['arrival']['terminal'],
//       arrivalGate: json['arrival']['gate'],
//       arrivalBaggage: json['arrival']['baggage'],
//       aircraftRegistration: json['aircraft']?['registration'],
//       liveLatitude: json['live']?['latitude']?.toDouble(),
//       liveLongitude: json['live']?['longitude']?.toDouble(),
//     );
//   }
// }
//
// // ================= Repository =================
// class FlightRepository {
//   final AviationService service;
//
//   FlightRepository({required this.service});
//
//   Future<List<FlightModel>> getFlights({String? flightNumber}) async {
//     final data = await service.getFlights(flightNumber: flightNumber);
//     return data.map((json) => FlightModel.fromJson(json)).toList();
//   }
// }
//
// // ================= Bloc / Cubit =================
//
//
// abstract class FlightState extends Equatable {
//   const FlightState();
//
//   @override
//   List<Object> get props => [];
// }
//
// class FlightInitial extends FlightState {}
// class FlightLoading extends FlightState {}
// class FlightLoaded extends FlightState {
//   final List<FlightModel> flights;
//   const FlightLoaded({required this.flights});
//
//   @override
//   List<Object> get props => [flights];
// }
// class FlightError extends FlightState {
//   final String message;
//   const FlightError({required this.message});
//
//   @override
//   List<Object> get props => [message];
// }
//
// class FlightCubit extends Cubit<FlightState> {
//   final FlightRepository repository;
//
//   FlightCubit({required this.repository}) : super(FlightInitial());
//
//   Future<void> fetchFlights() async {
//     emit(FlightLoading());
//     try {
//       final flights = await repository.getFlights();
//       emit(FlightLoaded(flights: flights));
//     } catch (e) {
//       emit(FlightError(message: e.toString()));
//     }
//   }
// }

// ================= UI: FlightScreen =================

class FlightScreen extends StatelessWidget {
  static const String routeName="flight";
  const FlightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FlightCubit(
        getFlightsUseCase: GetFlightsUseCase(
          FlightRepositoryImpl(service: AviationService()),
        ),
      )..fetchFlights(),
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          centerTitle: true,
          scrolledUnderElevation: 0,
          title: Shimmer.fromColors(
            baseColor: Colors.blue,
            highlightColor: AppColor.red,
            child: Text(
              "Flights",
              style: AppTextStyle.size24,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: BlocBuilder<FlightCubit, FlightState>(
            builder: (context, state) {
              if (state is FlightLoading) {
                return _buildShimmerLoading();
              } else if (state is FlightLoaded) {
                return _buildFlightList(state.flights);
              } else if (state is FlightError) {
                return Center(child: Text("Error: ${state.message}"));
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  // ================= Helper Widgets =================
  Widget _buildShimmerLoading() {
    return ListView.builder(
      itemCount: 5,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      itemBuilder: (_, index) => Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r)),
        elevation: 3,
        margin: EdgeInsets.symmetric(vertical: 8.h),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 18.h, width: 150.w, color: Colors.white),
                SizedBox(height: 8.h),
                Container(height: 14.h, width: 80.w, color: Colors.white),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Container(height: 16.h, color: Colors.white)),
                    Expanded(
                        flex: 1,
                        child: Center(
                            child: Container(
                                height: 16.h, width: 16.h, color: Colors.white))),
                    Expanded(
                        flex: 3,
                        child: Container(height: 16.h, color: Colors.white)),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(height: 14.h, width: 60.w, color: Colors.white),
                        SizedBox(height: 4.h),
                        Container(height: 16.h, width: 80.w, color: Colors.white),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(height: 14.h, width: 60.w, color: Colors.white),
                        SizedBox(height: 4.h),
                        Container(height: 16.h, width: 80.w, color: Colors.white),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFlightList(List<Flight> allFlights) {
    final egyptAirports = [
      "Cairo International Airport",
      "Borg El Arab International Airport",
      "Hurghada International Airport",
      "Luxor International Airport",
      "Sharm El Sheikh International Airport",
      "Aswan International Airport",
      "Alexandria Airport",
      "Marsa Alam International Airport",
      "Sohag Airport",
      "Taba Airport",
    ];

    final egyptFlights = allFlights.where((f) =>
        egyptAirports.any((airport) =>
        f.departureAirport.contains(airport) ||
            f.arrivalAirport.contains(airport))).toList();

    final otherFlights = allFlights.where((f) =>
    !egyptAirports.any((airport) =>
    f.departureAirport.contains(airport) ||
        f.arrivalAirport.contains(airport))).toList();

    final flights = [...egyptFlights, ...otherFlights];

    if (flights.isEmpty) return const Center(child: Text("No flights found"));

    return ListView.builder(
      itemCount: flights.length,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      itemBuilder: (_, index) => _buildFlightCard(
        flights[index],
        isEgyptFlight: egyptFlights.contains(flights[index]),
      ),
    );
  }

  Widget _buildFlightCard(Flight f, {required bool isEgyptFlight}) {
    return Card(
      color: isEgyptFlight ? Colors.yellow[50] : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${f.airline} - ${f.flightNumber}",
                style: AppTextStyle.size18.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: 8.h),
            _buildStatus(f.status),
            SizedBox(height: 8.h),
            _buildAirportsRow(f.departureAirport, f.arrivalAirport),
            SizedBox(height: 8.h),
            _buildTimeRow(f.departureTime, f.arrivalTime),
          ],
        ),
      ),
    );
  }

  Widget _buildStatus(String status) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: getStatusColor(status).withOpacity(0.2),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        status.toUpperCase(),
        style: AppTextStyle.size14.copyWith(
            fontWeight: FontWeight.bold, color: getStatusColor(status)),
      ),
    );
  }

  Widget _buildAirportsRow(String departure, String arrival) {
    return Row(
      children: [
        Flexible(
          flex: 3,
          child: Text(departure, style: AppTextStyle.size16, overflow: TextOverflow.ellipsis),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: Icon(Icons.airplanemode_active, color: Colors.blue),
          ),
        ),
        Flexible(
          flex: 3,
          child: Text(arrival,
              style: AppTextStyle.size16, textAlign: TextAlign.end, overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }

  Widget _buildTimeRow(String departureTime, String arrivalTime) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Departure", style: AppTextStyle.size14.copyWith(color: Colors.grey)),
            Text(formatTime(departureTime),
                style: AppTextStyle.size16.copyWith(fontWeight: FontWeight.w500)),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("Arrival", style: AppTextStyle.size14.copyWith(color: Colors.grey)),
            Text(formatTime(arrivalTime),
                style: AppTextStyle.size16.copyWith(fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    );
  }

  // ================= Helper Functions =================
  String formatTime(String dateTime) {
    try {
      final dt = DateTime.parse(dateTime);
      return "${dt.day}/${dt.month}/${dt.year} ${dt.hour}:${dt.minute.toString().padLeft(2, '0')}";
    } catch (e) {
      return dateTime;
    }
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'scheduled':
        return Colors.orange;
      case 'landed':
        return Colors.green;
      case 'active':
        return Colors.blue;
      case 'cancelled':
      case 'diverted':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
