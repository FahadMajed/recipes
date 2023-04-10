import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/lib.dart';

class RecipesController extends AsyncViewController<List<Recipe>> {
  late final GetRecipes getRecipes;
  late final SearchRecipes searchRecipes;

  RecipesController(super.read) : super(viewModelPvdr: recipesPvdr) {
    getRecipes = read(getRecipesPvdr);
    searchRecipes = read(searchRecipesPvdr);
    callGetRecipes();
  }

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
}

final recipesCtrlPvdr = Provider((ref) => RecipesController(ref.read));

final recipesPvdr = StateProvider<AsyncValue<List<Recipe>>>(
    (ref) => const AsyncLoading<List<Recipe>>());

final selectedDestPvdr = StateProvider((ref) => 0);
