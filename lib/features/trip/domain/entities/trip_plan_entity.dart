import 'Places_entity.dart';

class TripPlanEntity {
  final String day;
  final List<PlacesEntity> places;

  TripPlanEntity({
    required this.day,
    required this.places,
  });
}
