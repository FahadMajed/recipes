import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/lib.dart';

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

final favouriteRecipePvdr = Provider(
    (ref) => FavouriteRecipe(repository: ref.read(favRecipesRepoPvdr)));
