import 'package:amun/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:amun/features/home/domain/entities/classical_entity.dart';
import 'package:amun/features/home/domain/entities/hotel_entity.dart';
import 'package:amun/features/home/domain/entities/riviera_entity.dart';
import 'package:amun/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository{

  HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl(this.homeRemoteDataSource);

  @override
  Future<List<ClassicalEntity>> getClassicalHighlights() async{
    try{
      var classicalEntity = await homeRemoteDataSource.getClassicalHighlights();
      return classicalEntity.map((model) => ClassicalEntity(
        name: model.name,
        description: model.description,
        address: model.address,
        cost: model.cost,
        imageUrl: model.imageUrl,
        rating: model.rating,
        type: model.type,
      )).toList();
    }catch(e){
      rethrow;
    }
  }

  @override
  Future<List<HotelEntity>> getHotels() async {
    try {
      var hotels = await homeRemoteDataSource.getHotels();
      return hotels.map((model) => HotelEntity(
        name: model.name,
        link: model.link,
        type: model.type,
        latitude: model.latitude,
        longitude: model.longitude,
        checkIn: model.checkIn,
        checkOut: model.checkOut,
        overallRating: model.overallRating,
        locationRating: model.locationRating,
        reviews: model.reviews,
        amenities: model.amenities,
        excludedAmenities: model.excludedAmenities,
        essentialInfo: model.essentialInfo,
        nearbyPlaces: model.nearbyPlaces,
        ratingsBreakdown: model.ratingsBreakdown,
        reviewsBreakdown: model.reviewsBreakdown,
        lowestRate: model.lowestRate,
        beforeTaxes: model.beforeTaxes,
        totalLowest: model.totalLowest,
        totalBeforeTaxes: model.totalBeforeTaxes,
      )).toList();
    } catch (e) {
      rethrow;
    }
  }


  @override
  Future<List<RivieraEntity>> getRivieraHighlights() async{
    try{
      var rivieraEntity = await homeRemoteDataSource.getRivieraHighlights();
      return rivieraEntity.map((model) => RivieraEntity(
        name: model.name,
        description: model.description,
        address: model.address,
        cost: model.cost,
        imageUrl: model.imageUrl,
        rating: model.rating,
        type: model.type,
      )).toList();
    }catch(e){
      rethrow;
    }
  }

}