import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:recipes/lib.dart';

void main() {
  setUp(() async {
    var path = Directory.current.path;
    Hive.init(path);
    await Hive.openBox("favourite_recipes");
  });

  final favRepo = DefaultFavouriteRecipesRepository();
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
