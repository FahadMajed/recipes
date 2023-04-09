import 'package:flutter_test/flutter_test.dart';

import 'package:recipes/lib.dart';

import '../data/fake_favourite.dart';
import '../data/fake_recipe_repository.dart';

void main() {
  final fakeFavRepo = FakeFavouriteRecipesRepository();
  final fakeRecipeRepo = FakeRecipesRepository();

  setUp(() => fakeFavRepo
      .addFavouriteRecipe(Recipe(name: "French Frise", isFavourite: true)));
  test('should get recieps with favourite status', () async {
    final recipes = await GetRecipes(
      recipesRepository: fakeRecipeRepo,
      favouriteRecipesRepository: fakeFavRepo,
    ).call();

    expect(recipes.first.isFavourite, true);
    assert(recipes.length > 2);
  });
}
