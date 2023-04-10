// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/domain/domain.dart';
import 'package:recipes/features/features.dart';
import 'package:recipes/packages/ui/ui.dart';

class RecipeDetailsScreen extends ConsumerWidget {
  Recipe recipe;

  RecipeDetailsScreen({
    required this.recipe,
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  recipe.name,
                  style: titleExtraLargeBold,
                ),
              ),
              sizedHeight8,
              RecipeImage(recipe: recipe),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedHeight8,
                    const Text(
                      "Ingredients",
                      style: titleExtraLarge,
                    ),
                    RecipeIngredients(recipe: recipe),
                    divider16,
                    const Text(
                      "Quantities",
                      style: titleExtraLarge,
                    ),
                    sizedHeight8,
                    for (final quantity in recipe.quantities)
                      Column(
                        children: [
                          SelectableText("- $quantity"),
                          sizedHeight4,
                        ],
                      ),
                    sizedHeight16,
                    FilledBotton(
                      title: "Let's Make It!",
                      onPressed: () {},
                    ),
                    sizedHeight8,
                    StatefulBuilder(builder: (context, setState) {
                      return FilledBotton(
                        title: recipe.isFavourite
                            ? "Remove From Favorites"
                            : "Add To Favorites",
                        onPressed: () {
                          ref
                              .read(recipesCtrlPvdr)
                              .onFavouriteButtonPressed(recipe)
                              .then((updatedRecipe) =>
                                  setState(() => recipe = updatedRecipe));
                        },
                        style: FilledBottonStyle.accent,
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
