// ignore_for_file: avoid_renaming_method_parameters

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/packages/utilities/utilities.dart';

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

final searchRecipesPvdr = Provider(
    (ref) => SearchRecipes(recipesRepostory: ref.read(recipesRepoPvdr)));
