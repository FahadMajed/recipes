import 'package:hive/hive.dart';
import 'package:recipes/lib.dart';

class DefaultFavouriteRecipesRepository implements FavouriteRecipesRepository {
  Box get _favsBox => Hive.box("favourite_recipes");

  @override
  final List<Recipe> favourites = [];

  @override
  Future<void> addFavouriteRecipe(Recipe recipe) async {
    _favsBox.put(recipe.name, recipe.toMap());
  }

  @override
  Future<List<Recipe>> getFavourites() async {
    final recipes = _favsBox.values;
    return recipes.map((e) => Recipe.fromMap(e)).toList();
  }

  @override
  void removeFavouriteRecipe(Recipe recipe) {
    _favsBox.delete(recipe.name);
  }
}
