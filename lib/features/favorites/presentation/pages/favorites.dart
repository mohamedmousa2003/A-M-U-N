import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/favorite_repositoryImpl.dart';
import '../../domain/entities/favorite_item.dart';
import '../../domain/use_cases/add_favorite.dart';
import '../../domain/use_cases/check_favorite.dart';
import '../../domain/use_cases/get_favorites.dart';
import '../../domain/use_cases/remove_favorite.dart';
import '../cubit/favorite_cubit.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = FavoriteRepositoryImpl();
    return Scaffold(
      appBar: AppBar(title: const Text("Favorites")),
      body: BlocProvider(
        create: (context) => FavoriteCubit(
          addFavorite: AddFavoriteUseCase(repository),
          removeFavorite: RemoveFavoriteUseCase(repository),
          getFavorites: GetFavorites(repository),
          isFavoriteUseCase: IsFavoriteUseCase(repository),
        ),
        child: BlocBuilder<FavoriteCubit, List<FavoriteItem>>(
          builder: (context, favorites) {
            if (favorites.isEmpty) {
              return const Center(child: Text("No favorites yet"));
            }

            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final item = favorites[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      item.imageUrl,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported),
                    ),
                  ),
                  title: Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(item.type.name),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      context.read<FavoriteCubit>().toggleFavorite(item);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${item.title} removed from favorites"),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
