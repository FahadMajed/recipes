import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/domain/domain.dart';

abstract class RecipesRepostory {
  final Map<String, Recipe> recipes = {};

  Future<List<Recipe>> getRecipesByTerm(String term);

  Future<List<Recipe>> getRecipes(int end);
}

final recipesRepoPvdr =
    Provider<RecipesRepostory>((ref) => throw UnimplementedError());
