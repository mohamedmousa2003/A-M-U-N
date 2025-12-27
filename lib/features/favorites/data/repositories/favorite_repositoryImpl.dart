import '../../domain/entities/favorite_item.dart';
import '../../domain/repositories/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final List<FavoriteItem> _favorites = [];

  @override
  void addToFavorites(FavoriteItem item) {
    if (!_favorites.any((e) => e.id == item.id)) {
      _favorites.add(item);
    }
  }

  @override
  void removeFromFavorites(String id) {
    _favorites.removeWhere((e) => e.id == id);
  }

  @override
  List<FavoriteItem> getFavorites() {
    return List.unmodifiable(_favorites);
  }

  @override
  bool isFavorite(String id) {
    return _favorites.any((e) => e.id == id);
  }
}
