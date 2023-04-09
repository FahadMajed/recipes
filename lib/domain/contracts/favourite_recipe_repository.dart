import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/domain/domain.dart';

abstract class FavouriteRecipesRepository {
  final List<Recipe> favourites = [];
  Future<void> addFavouriteRecipe(Recipe recipe);

  void removeFavouriteRecipe(Recipe recipe);

  Future<List<Recipe>> getFavourites();
}

final favRecipesRepoPvdr =
    Provider<FavouriteRecipesRepository>((ref) => throw UnimplementedError());
