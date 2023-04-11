import 'package:hive/hive.dart';
import 'package:recipes/lib.dart';

class DefaultFavouriteRecipesRepository implements FavouriteRecipesRepository {
  Box get _favsBox => Hive.box("favourite_recipes");

  final List<Recipe> _favourites = [];

  @override
  Future<void> addFavouriteRecipe(Recipe recipe) async {
    _favourites.add(recipe);
    _favsBox.put(recipe.name, recipe.toMap());
  }

  @override
  Future<List<Recipe>> getFavourites() async {
    if (_favourites.isNotEmpty) {
      return _favourites;
    } else {
      final favRecipesData = _favsBox.values;
      final recipes = favRecipesData.map((e) => Recipe.fromMap(e)).toList();
      _favourites.addAll(recipes);

      return _favourites;
    }
  }

  @override
  void removeFavouriteRecipe(Recipe recipe) {
    _favsBox.delete(recipe.name);
    _favourites.removeWhere((r) => r.name == recipe.name);
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
