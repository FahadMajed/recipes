import 'package:flutter_test/flutter_test.dart';

import 'package:recipes/domain/domain.dart';

import '../data/fake_recipe_repository.dart';

void main() {
  test('should return recipes by search term', () async {
    final recipes =
        await SearchRecipes(recipesRepostory: FakeRecipesRepository())
            .call("F");

    expect(recipes.first.name, "French Toast");
    expect(recipes.length, 2);
  });

  test('should return empty list', () async {
    final recipes =
        await SearchRecipes(recipesRepostory: FakeRecipesRepository())
            .call("Fahad");

    expect(recipes, []);
  });
}
