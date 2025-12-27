import 'package:bloc/bloc.dart';

import '../../domain/entities/favorite_item.dart';
import '../../domain/use_cases/add_favorite.dart';
import '../../domain/use_cases/check_favorite.dart';
import '../../domain/use_cases/get_favorites.dart';
import '../../domain/use_cases/remove_favorite.dart';

class FavoriteCubit extends Cubit<List<FavoriteItem>> {
  final AddFavoriteUseCase addFavorite;
  final RemoveFavoriteUseCase removeFavorite;
  final GetFavorites getFavorites;
  final IsFavoriteUseCase isFavoriteUseCase;

  FavoriteCubit({
    required this.addFavorite,
    required this.removeFavorite,
    required this.getFavorites,
    required this.isFavoriteUseCase,
  }) : super([]);

  void loadFavorites() {
    emit(getFavorites());
  }

  void toggleFavorite(FavoriteItem item) {
    if (isFavoriteUseCase(item.id)) {
      removeFavorite(item.id);
    } else {
      addFavorite(item);
    }
    emit(getFavorites());
  }

  bool isFavorite(String id) {
    return isFavoriteUseCase(id);
  }
}
