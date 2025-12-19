import '../../features/trip/data/models/TripModel.dart';
import '../../features/trip/domain/entities/Places_entity.dart';

extension PlacesModelMapper on Places {
  PlacesEntity toEntity() {
    return PlacesEntity(
      name: name ?? '',
      type: type ?? '',
      cost: cost ?? 0,
      rating: rating ?? 0,
      latitude: latitude ?? 0,
      longitude: longitude ?? 0,
      description: description ?? '',
      address: address ?? '',
      openingHours: openingHours ?? '',
      bestTimeToVisit: bestTimeToVisit ?? '',
      image: image ?? '',
      recommendedActivities: recommendedActivities ?? '',
      visitDuration: visitDuration ?? '',
    );
  }
}
