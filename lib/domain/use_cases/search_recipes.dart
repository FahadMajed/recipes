// ignore_for_file: avoid_renaming_method_parameters

import 'package:recipes/core/use_case.dart';
import 'package:recipes/domain/domain.dart';

class SearchRecipes extends UseCase<String, List<Recipe>> {
  final RecipesRepostory recipesRepostory;

  SearchRecipes({
    required this.recipesRepostory,
  });

  @override
  Future<List<Recipe>> call(String term) async {
    final recipes = await recipesRepostory.getRecipesByTerm(term);
    return recipes;
  }
}
