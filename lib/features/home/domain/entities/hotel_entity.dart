class HotelEntity {
  final String? type;
  final String? name;
  final String? link;
  final double? latitude;
  final double? longitude;
  final String? checkIn;
  final String? checkOut;
  final double? overallRating;
  final double? locationRating;
  final int? reviews;
  final List<String>? amenities;
  final List<String>? excludedAmenities;
  final String? essentialInfo;
  final String? nearbyPlaces;
  final String? ratingsBreakdown;
  final String? reviewsBreakdown;
  final String? lowestRate;
  final String? beforeTaxes;
  final String? totalLowest;
  final String? totalBeforeTaxes;

  HotelEntity({
    this.type,
    this.name,
    this.link,
    this.latitude,
    this.longitude,
    this.checkIn,
    this.checkOut,
    this.overallRating,
    this.locationRating,
    this.reviews,
    this.amenities,
    this.excludedAmenities,
    this.essentialInfo,
    this.nearbyPlaces,
    this.ratingsBreakdown,
    this.reviewsBreakdown,
    this.lowestRate,
    this.beforeTaxes,
    this.totalLowest,
    this.totalBeforeTaxes,
  });
}
