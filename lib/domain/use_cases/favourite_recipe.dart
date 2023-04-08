import 'package:recipes/lib.dart';
import 'package:recipes/packages/utilities/utilities.dart';

class FavouriteRecipe extends UseCase<Recipe, Recipe> {
  final FavouriteRecipesRepository repository;

  FavouriteRecipe({
    required this.repository,
  });

  @override
  Future<Recipe> call(Recipe recipe) async {
    final updatedRecipe = recipe.toggleFavourite();
    if (updatedRecipe.isFavourite) {
      repository.addFavouriteRecipe(updatedRecipe);
    } else {
      repository.removeFavouriteRecipe(updatedRecipe);
    }
    return updatedRecipe;
  }
}
