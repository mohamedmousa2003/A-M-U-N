class PlacesEntity {
  final String name;
  final String type;
  final int cost;
  final int rating;
  final double latitude;
  final double longitude;
  final String description;
  final String address;
  final String openingHours;
  final String bestTimeToVisit;
  final String image;
  final String recommendedActivities;
  final String visitDuration;

  PlacesEntity({
    required this.name,
    required this.type,
    required this.cost,
    required this.rating,
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.address,
    required this.openingHours,
    required this.bestTimeToVisit,
    required this.image,
    required this.recommendedActivities,
    required this.visitDuration,
  });
}
