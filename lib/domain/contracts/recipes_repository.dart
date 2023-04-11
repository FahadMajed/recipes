import 'package:recipes/domain/domain.dart';

abstract class RecipesRepostory {
  final Map<String, Recipe> recipes = {};

  Future<List<Recipe>> getRecipesByTerm(String term);

  Future<List<Recipe>> getRecipes(int limit);
}
