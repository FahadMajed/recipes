import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/lib.dart';

class RecipesController extends AsyncViewController<List<Recipe>> {
  late final GetRecipes getRecipes;
  late final SearchRecipes searchRecipes;
  late final FavouriteRecipe favouriteRecipe;

  RecipesController(super.read) : super(viewModelPvdr: recipesPvdr) {
    getRecipes = read(getRecipesPvdr);
    searchRecipes = read(searchRecipesPvdr);
    favouriteRecipe = read(favouriteRecipePvdr);
    callGetRecipes();
  }

  List<Recipe> get recipes => viewModelAsData;

  Future<void> callGetRecipes() async {
    getRecipes
        .call()
        .then((recipes) => emitData(recipes))
        .onError((error, stackTrace) => emitError(error));
  }

  Future<void> onSearchTermChanged(String? term) async {
    if (term == null || term.isEmpty) {
      callGetRecipes();
    } else {
      searchRecipes
          .call(term)
          .then((recipes) => emitData(recipes))
          .onError((error, stackTrace) => emitError(error));
    }
  }

  Future<Recipe> onFavouriteButtonPressed(Recipe recipe) async {
    return favouriteRecipe.call(recipe).then((updatedRecipe) {
      if (updatedRecipe.isFavourite) {
        Toast.success("${updatedRecipe.name} is now on your favorites!");
      } else {
        Toast.success("${updatedRecipe.name} removed from favorites!");
      }
      final updatedRecipes = [
        for (final recipe in recipes)
          if (recipe.name == updatedRecipe.name) updatedRecipe else recipe
      ];

      read(favsCtrlPvdr).emitData(updatedRecipes);
      emitData(updatedRecipes);
      return updatedRecipe;
    }).onError((error, stackTrace) {
      emitError(error);
      return recipe;
    });
  }
}

final recipesCtrlPvdr = Provider((ref) => RecipesController(ref.read));

final recipesPvdr = StateProvider<AsyncValue<List<Recipe>>>(
    (ref) => const AsyncLoading<List<Recipe>>());

final selectedDestPvdr = StateProvider((ref) => 0);
