import 'package:recipes/domain/domain.dart';

abstract class FavouriteRecipesRepository {
  final List<Recipe> favourites = [];
  Future<void> addFavouriteRecipe(Recipe recipe);

  void removeFavouriteRecipe(Recipe recipe);

  Future<List<Recipe>> getFavourites();
}
