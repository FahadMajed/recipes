import 'package:recipes/domain/domain.dart';
import 'package:recipes/packages/utilities/utilities.dart';

class GetRecipes extends NoRequestUseCase<List<Recipe>> {
  final RecipesRepostory recipesRepostory;
  final FavouriteRecipesRepository favouriteRecipesRepository;

  GetRecipes({
    required this.recipesRepostory,
    required this.favouriteRecipesRepository,
  });

  @override
  Future<List<Recipe>> call() async {
    final recipes = await recipesRepostory.getRecipes(5);
    final favouriteRecipes = await favouriteRecipesRepository.getFavourites();
    final favouritesNames = [
      for (final recipe in favouriteRecipes) recipe.name
    ];

    recipes.removeWhere((r) => favouritesNames.contains(r.name));

    return [...favouriteRecipes, ...recipes];
  }
}
