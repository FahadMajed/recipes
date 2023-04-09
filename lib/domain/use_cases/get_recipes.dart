import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/domain/domain.dart';
import 'package:recipes/packages/utilities/utilities.dart';

class GetRecipes extends NoRequestUseCase<List<Recipe>> {
  final RecipesRepostory recipesRepository;
  final FavouriteRecipesRepository favouriteRecipesRepository;

  GetRecipes({
    required this.recipesRepository,
    required this.favouriteRecipesRepository,
  });

  @override
  Future<List<Recipe>> call() async {
    final recipes = await recipesRepository.getRecipes(5);
    final favouriteRecipes = await favouriteRecipesRepository.getFavourites();
    final favouritesNames = [
      for (final recipe in favouriteRecipes) recipe.name
    ];

    recipes.removeWhere((r) => favouritesNames.contains(r.name));

    return [...favouriteRecipes, ...recipes];
  }
}

final getRecipesPvdr = Provider((ref) => GetRecipes(
    recipesRepository: ref.read(recipesRepoPvdr),
    favouriteRecipesRepository: ref.read(favRecipesRepoPvdr)));
