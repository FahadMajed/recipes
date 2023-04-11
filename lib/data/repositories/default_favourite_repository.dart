import 'package:hive/hive.dart';
import 'package:recipes/lib.dart';

class DefaultFavouriteRecipesRepository implements FavouriteRecipesRepository {
  Box get _favsBox => Hive.box("favourite_recipes");

  @override
  final List<Recipe> favourites = [];

  @override
  Future<void> addFavouriteRecipe(Recipe recipe) async {
    favourites.add(recipe);
    _favsBox.put(recipe.name, recipe.toMap());
  }

  @override
  Future<List<Recipe>> getFavourites() async {
    if (favourites.isNotEmpty) {
      return favourites;
    } else {
      final favRecipesData = _favsBox.values;
      final recipes = favRecipesData.map((e) => Recipe.fromMap(e)).toList();
      favourites.addAll(recipes);
      return favourites;
    }
  }

  @override
  void removeFavouriteRecipe(Recipe recipe) {
    _favsBox.delete(recipe.name);
    favourites.removeWhere((r) => r.name == recipe.name);
  }

  @override
  bool isRecipeFavorited(String name) {
    final recipe = favourites.firstWhere(
      (recipe) => recipe.name == name,
      orElse: () => Recipe(name: "", isFavourite: false),
    );
    return recipe.isFavourite;
  }
}
