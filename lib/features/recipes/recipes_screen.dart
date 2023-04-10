// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/recipes/recipes_controller.dart';
import 'package:recipes/lib.dart';

class _RecipesScreen extends ViewState<RecipesScreen, AsyncValue<List<Recipe>>,
    RecipesController> {
  _RecipesScreen(super.viewModelProvider, super.viewControllerProvider);
  @override
  Widget buildView() {
    final recipes = viewModel;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recipes",
          style: titleExtraLargeBold,
        ),
        sizedHeight8,
        const SearchBar(),
        sizedHeight16,
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              ...recipes.when(
                data: (recipes) =>
                    [for (final recipe in recipes) RecipeCard(recipe: recipe)],
                error: (e, __) => [Text(e.toString())],
                loading: () => [
                  const Loading(),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class RecipesScreen extends View {
  const RecipesScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RecipesScreen(
        recipesPvdr,
        recipesCtrlPvdr,
      );
}

final recipes = [
  Recipe(
    name: "Pancake With Raspberry",
    rating: 100,
    imageUrl:
        "https://img.buzzfeed.com/thumbnailer-prod-us-east-1/video-api/assets/360219.jpg",
    isFavourite: false,
    topics: ["Breakfast", "Community Recipe"],
  ),
  Recipe(
    name: "Griddle Stackers",
    rating: 100,
    imageUrl:
        "https://img.buzzfeed.com/thumbnailer-prod-us-east-1/video-api/assets/360217.jpg",
    isFavourite: false,
    topics: ["Launch", "Vitamens", "Healthy"],
  ),
  Recipe(
    name: "Oroe Chocolate Chips",
    rating: 75,
    imageUrl:
        "https://img.buzzfeed.com/thumbnailer-prod-us-east-1/video-api/assets/360213.jpg",
    isFavourite: true,
    topics: ["Sweet", "Almonds", "Fast"],
  ),
];
