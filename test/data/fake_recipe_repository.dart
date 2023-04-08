import 'package:recipes/domain/domain.dart';

class FakeRecipesRepository implements RecipesRepostory {
  final Map<String, Recipe> _recipes = {
    "French Toast": Recipe(name: "French Toast"),
    "Omlete": Recipe(name: "Omlete"),
    "Turkey Breast": Recipe(name: "Turkey Breast"),
    "French Frise": Recipe(name: "French Frise"),
  };

  @override
  Future<List<Recipe>> getRecipesByTerm(String term) async {
    List<Recipe> matchingRecipes = [];

    for (final key in _recipes.keys) {
      if (key.toLowerCase().startsWith(term.toLowerCase())) {
        matchingRecipes.add(_recipes[key]!);
      }
    }
    return matchingRecipes;
  }
}
