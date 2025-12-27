class FavoriteItem {
  final String id;
  final String title;
  final String imageUrl;
  final FavoriteType type;
  final Object originalEntity;

  FavoriteItem({
    required this.id,
    required this.imageUrl,
    required this.type, required this.title, required this.originalEntity,
});

}

enum FavoriteType {
  classical,
  hotel,
  riviera,
}