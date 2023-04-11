import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:recipes/domain/domain.dart';
import 'package:recipes/packages/utilities/utilities.dart';

class GetRecipes extends UseCase<int, List<Recipe>> {
  final RecipesRepostory recipesRepository;
  final FavouriteRecipesRepository favouriteRecipesRepository;

  GetRecipes({
    required this.recipesRepository,
    required this.favouriteRecipesRepository,
  });

  @override
  // ignore: avoid_renaming_method_parameters
  Future<List<Recipe>> call(int from) async {
    await favouriteRecipesRepository.getFavourites();
    final recipes = await recipesRepository.getRecipes(from);
    return recipes
        .map((recipe) =>
            favouriteRecipesRepository.isRecipeFavorited(recipe.name)
                ? recipe.copyWith(isFavourite: true)
                : recipe)
        .toList();
  }
}

class GetRecipesRequest {
  final int from;

  final bool isRefreshing;
  GetRecipesRequest({
    required this.from,
    required this.isRefreshing,
  });
}

final getRecipesPvdr = Provider((ref) => GetRecipes(
    recipesRepository: ref.read(recipesRepoPvdr),
    favouriteRecipesRepository: ref.read(favRecipesRepoPvdr)));
