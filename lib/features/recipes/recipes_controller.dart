import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/lib.dart';

class RecipesController extends AsyncViewController<List<Recipe>> {
  final searchCtrl = TextEditingController();

  late final GetRecipes getRecipes;
  late final SearchRecipes searchRecipes;
  late final FavouriteRecipe favouriteRecipe;

  RecipesController(super.read) : super(viewModelPvdr: recipesPvdr) {
    getRecipes = read(getRecipesPvdr);
    searchRecipes = read(searchRecipesPvdr);
    favouriteRecipe = read(favouriteRecipePvdr);
    callGetRecipes(20);
  }

  List<Recipe> get recipes => viewModelAsData;

  bool get hasSearched => searchCtrl.text.isNotEmpty;

  Future<void> callGetRecipes(int end) async {
    getRecipes
        .call(end)
        .then((recipes) => emitData(recipes))
        .onError((error, stackTrace) => emitError(error));
  }

  Future<void> onSearchTermChanged(String? term) async => searchRecipes
      .call(term ?? "")
      .then((recipes) => read(searchedRecipesPvdr.notifier).state = recipes);

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

final searchedRecipesPvdr = StateProvider<List<Recipe>>((ref) => []);

final selectedDestPvdr = StateProvider((ref) => 0);
