import 'package:recipes/lib.dart';

class FakeFavouriteRecipesRepository implements FavouriteRecipesRepository {
  final List<Recipe> _favourites = [];
  @override
  Future<void> addFavouriteRecipe(Recipe recipe) async {
    _favourites.add(recipe);
  }

  @override
  void removeFavouriteRecipe(Recipe recipe) {
    _favourites.removeWhere((r) => r.name == recipe.name);
  }

  @override
  Future<List<Recipe>> getFavourites() async {
    return _favourites;
  }

  @override
  bool isRecipeFavorited(String name) {
    final recipe = _favourites.firstWhere(
      (recipe) => recipe.name == name,
      orElse: () => Recipe(name: "", isFavourite: false),
    );
    return recipe.isFavourite;
  }
}
