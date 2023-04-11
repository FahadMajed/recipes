import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/lib.dart';

class FavoritesController extends AsyncViewController<List<Recipe>> {
  late final FavouriteRecipesRepository favouriteRecipesRepository;
  FavoritesController(super.read) : super(viewModelPvdr: favRecipesPvdr) {
    favouriteRecipesRepository = read(favRecipesRepoPvdr);

    callGetRecipes();
  }

  List<Recipe> get recipes => viewModelAsData;

  Future<void> callGetRecipes() async {
    favouriteRecipesRepository
        .getFavourites()
        .then((recipes) => emitData(recipes))
        .onError((error, stackTrace) => emitError(error));
  }

  void onExploreRecipes() {
    read(selectedDestPvdr.notifier).state = 0;
  }
}

final favsCtrlPvdr = Provider((ref) => FavoritesController(ref.read));

final favRecipesPvdr = StateProvider<AsyncValue<List<Recipe>>>(
    (ref) => const AsyncLoading<List<Recipe>>());
