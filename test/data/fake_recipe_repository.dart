import 'package:recipes/domain/domain.dart';

class FakeRecipesRepository implements RecipesRepostory {
  @override
  final Map<String, Recipe> recipes = {
    "French Toast": Recipe(name: "French Toast"),
    "Omlete": Recipe(name: "Omlete"),
    "Turkey Breast": Recipe(name: "Turkey Breast"),
    "French Frise": Recipe(name: "French Frise"),
  };

  @override
  Future<List<Recipe>> getRecipesByTerm(String term) async {
    List<Recipe> matchingRecipes = [];

    for (final key in recipes.keys) {
      if (key.toLowerCase().startsWith(term.toLowerCase())) {
        matchingRecipes.add(recipes[key]!);
      }
    }
    return matchingRecipes;
  }

  @override
  Future<List<Recipe>> getRecipes(int limit) async {
    return recipes.values.toList();
  }
}
