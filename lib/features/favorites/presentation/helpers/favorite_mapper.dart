

import '../../../home/domain/entities/classical_entity.dart';
import '../../../home/domain/entities/hotel_entity.dart';
import '../../../home/domain/entities/riviera_entity.dart';
import '../../domain/entities/favorite_item.dart';

FavoriteItem classicalToFavorite(ClassicalEntity item) {
  return FavoriteItem(
    id: item.name!,
    title: item.name ?? '',
    imageUrl: item.imageUrl ?? '',
    type: FavoriteType.classical,
    originalEntity: item,
  );
}

FavoriteItem hotelToFavorite(HotelEntity item) {
  return FavoriteItem(
    id: item.name!,
    title: item.name ?? '',
    imageUrl: item.name ?? '',
    type: FavoriteType.hotel,
    originalEntity: item,
  );
}

FavoriteItem rivieraToFavorite(RivieraEntity item) {
  return FavoriteItem(
    id: item.name!,
    title: item.name ?? '',
    imageUrl: item.imageUrl ?? '',
    type: FavoriteType.riviera,
    originalEntity: item,
  );
}
