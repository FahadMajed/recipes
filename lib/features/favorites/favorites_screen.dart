// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/lib.dart';

class _FavouritesScreen extends ViewState<FavouritesScreen,
    AsyncValue<List<Recipe>>, FavoritesController> {
  _FavouritesScreen(super.viewModelProvider, super.viewControllerProvider);
  @override
  Widget buildView() {
    final recipes = viewModel;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Favorites",
          style: titleExtraLargeBold,
        ),
        sizedHeight8,
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              ...recipes.when(
                data: (recipes) => [
                  if (recipes.isEmpty)
                    EmptyStateContainer(
                      text: "No Favorites Yet",
                      buttonTitle: "Explore Recipes",
                      iconData: Icons.heart_broken,
                      onButtonPressed: viewController.onExploreRecipes,
                    ),
                  for (final recipe in recipes)
                    if (recipe.isFavourite) RecipeCard(recipe: recipe)
                ],
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

class FavouritesScreen extends View {
  const FavouritesScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavouritesScreen(
        favRecipesPvdr,
        favsCtrlPvdr,
      );
}
