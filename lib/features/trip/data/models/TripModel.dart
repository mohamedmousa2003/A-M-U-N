import '../../domain/entities/Places_entity.dart';
import '../../domain/entities/trip_entity.dart';

class TripModel {
  TripModel({
      this.arrivalAirport, 
      this.bestTimeToVisit, 
      this.suggestedMonth, 
      this.tripPlan, 
      this.totalCost,});

  TripModel.fromJson(dynamic json) {
    arrivalAirport = json['arrivalAirport'];
    bestTimeToVisit = json['bestTimeToVisit'];
    suggestedMonth = json['suggestedMonth'];
    if (json['tripPlan'] != null) {
      tripPlan = [];
      json['tripPlan'].forEach((v) {
        tripPlan?.add(TripPlan.fromJson(v));
      });
    }
    totalCost = json['totalCost'];
  }
  String? arrivalAirport;
  String? bestTimeToVisit;
  String? suggestedMonth;
  List<TripPlan>? tripPlan;
  int? totalCost;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['arrivalAirport'] = arrivalAirport;
    map['bestTimeToVisit'] = bestTimeToVisit;
    map['suggestedMonth'] = suggestedMonth;
    if (tripPlan != null) {
      map['tripPlan'] = tripPlan?.map((v) => v.toJson()).toList();
    }
    map['totalCost'] = totalCost;
    return map;
  }

}

class TripPlan {
  TripPlan({
      this.day, 
      this.places,});

  TripPlan.fromJson(dynamic json) {
    day = json['day'];
    if (json['places'] != null) {
      places = [];
      json['places'].forEach((v) {
        places?.add(Places.fromJson(v));
      });
    }
  }
  String? day;
  List<Places>? places;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = day;
    if (places != null) {
      map['places'] = places?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


class Places {
  Places({
      this.name, 
      this.type, 
      this.cost, 
      this.rating, 
      this.latitude, 
      this.longitude, 
      this.description, 
      this.address, 
      this.openingHours, 
      this.bestTimeToVisit, 
      this.image, 
      this.recommendedActivities, 
      this.visitDuration,});

  Places.fromJson(dynamic json) {
    name = json['name'];
    type = json['type'];
    cost = json['cost'];
    rating = json['rating'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    description = json['description'];
    address = json['address'];
    openingHours = json['openingHours'];
    bestTimeToVisit = json['bestTimeToVisit'];
    image = json['image'];
    recommendedActivities = json['recommendedActivities'];
    visitDuration = json['visitDuration'];
  }
  String? name;
  String? type;
  int? cost;
  int? rating;
  double? latitude;
  double? longitude;
  String? description;
  String? address;
  String? openingHours;
  String? bestTimeToVisit;
  String? image;
  String? recommendedActivities;
  String? visitDuration;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['type'] = type;
    map['cost'] = cost;
    map['rating'] = rating;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['description'] = description;
    map['address'] = address;
    map['openingHours'] = openingHours;
    map['bestTimeToVisit'] = bestTimeToVisit;
    map['image'] = image;
    map['recommendedActivities'] = recommendedActivities;
    map['visitDuration'] = visitDuration;
    return map;
  }

}

