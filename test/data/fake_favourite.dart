import 'package:recipes/lib.dart';

class FakeFavouriteRecipesRepository implements FavouriteRecipesRepository {
  @override
  final List<Recipe> favourites = [];
  @override
  Future<void> addFavouriteRecipe(Recipe recipe) async {
    favourites.add(recipe);
  }

  @override
  void removeFavouriteRecipe(Recipe recipe) {
    favourites.removeWhere((r) => r.name == recipe.name);
  }

  @override
  Future<List<Recipe>> getFavourites() async {
    return favourites;
  }

  @override
  bool isRecipeFavorited(String name) {
    // TODO: implement isRecipeFavorited
    throw UnimplementedError();
  }
}
