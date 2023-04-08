import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:recipes/domain/domain.dart';

void main() {
  setUp(() async {
    var path = Directory.current.path;
    Hive.init(path);
    await Hive.openBox("favourite_recipes");
  });

  final favRepo = DeafaultFavouriteRecipesRepository();
  test('should save favourite recipe', () async {
    favRepo.addFavouriteRecipe(Recipe(name: "Toast"));

    final recipes = await favRepo.getFavourites();

    expect(recipes.first.name, "Toast");
  });

  test('should remove favourite recipe', () async {
    favRepo.addFavouriteRecipe(Recipe(name: "Toast"));

    favRepo.removeFavouriteRecipe(Recipe(name: "Toast"));

    final recipes = await favRepo.getFavourites();

    expect(recipes, []);
  });
}

class DeafaultFavouriteRecipesRepository implements FavouriteRecipesRepository {
  Box get _favsBox => Hive.box("favourite_recipes");

  @override
  final List<Recipe> favourites = [];

  @override
  Future<void> addFavouriteRecipe(Recipe recipe) async {
    _favsBox.put(recipe.name, recipe.toMap());
  }

  @override
  Future<List<Recipe>> getFavourites() async {
    final recipes = _favsBox.values;
    return recipes.map((e) => Recipe.fromMap(e)).toList();
  }

  @override
  void removeFavouriteRecipe(Recipe recipe) {
    _favsBox.delete(recipe.name);
  }
}
