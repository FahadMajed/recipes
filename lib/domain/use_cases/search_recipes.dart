// ignore_for_file: avoid_renaming_method_parameters

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/packages/utilities/utilities.dart';

import 'package:recipes/domain/domain.dart';

class SearchRecipes extends UseCase<String, List<Recipe>> {
  final RecipesRepostory recipesRepostory;
  final FavouriteRecipesRepository favouriteRecipesRepository;
  SearchRecipes({
    required this.recipesRepostory,
    required this.favouriteRecipesRepository,
  });

  @override
  Future<List<Recipe>> call(String term) async {
    final result = <Recipe>[];
    final recipes = await recipesRepostory.getRecipesByTerm(term);
    for (final recipe in recipes) {
      final isRecipeFavorited =
          favouriteRecipesRepository.isRecipeFavorited(recipe.name);
      result.add(recipe.copyWith(isFavourite: isRecipeFavorited));
    }
    return result;
  }
}

final searchRecipesPvdr = Provider((ref) => SearchRecipes(
    recipesRepostory: ref.read(recipesRepoPvdr),
    favouriteRecipesRepository: ref.read(favRecipesRepoPvdr)));
