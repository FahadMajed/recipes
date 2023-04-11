import 'package:flutter_test/flutter_test.dart';

import '../data/fake_favourite.dart';
import '../data/fake_recipe_repository.dart';
import 'package:recipes/lib.dart';

void main() {
  final repository = FakeRecipesRepository();

  Future<Recipe> getFrenchToast() async {
    final recipes = await repository.getRecipes(0);
    final frenchToastIndex =
        recipes.indexWhere((r) => r.name == "French Toast");
    return recipes[frenchToastIndex];
  }

  test('should save recipe to favourties', () async {
    var frenchToast = await getFrenchToast();

    expect(frenchToast.isFavourite, false);

    final updatedToast =
        await FavouriteRecipe(repository: FakeFavouriteRecipesRepository())
            .call(frenchToast);

    expect(updatedToast.isFavourite, true);
  });

  test('should remove recipe from favourties', () async {
    var frenchToast = await getFrenchToast();

    var updatedToast =
        await FavouriteRecipe(repository: FakeFavouriteRecipesRepository())
            .call(frenchToast);

    updatedToast =
        await FavouriteRecipe(repository: FakeFavouriteRecipesRepository())
            .call(updatedToast);

    expect(updatedToast.isFavourite, false);
  });
}
