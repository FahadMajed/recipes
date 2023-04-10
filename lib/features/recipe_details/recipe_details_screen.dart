// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:recipes/lib.dart';

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
              RecipeName(recipe: recipe),
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
                    RecipeIngredients(recipe: recipe),
                    divider16,
                    RecipeQuantities(
                      quantities: recipe.quantities,
                    ),
                    sizedHeight16,
                    FilledBotton(
                      title: "Let's Make It!",
                      onPressed: () {
                        ref.read(pageModelPvdr.notifier).state = PageModel(
                          numberOfPages: recipe.ingredients.length + 2,
                          currentPage: 0,
                        );

                        Get.to(RecipeInstructionsScreen(
                          recipe: recipe,
                        ));
                      },
                    ),
                    sizedHeight8,
                    _builFavoriteButton(ref),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _builFavoriteButton(WidgetRef ref) => StatefulBuilder(
      builder: (_, setState) => FilledBotton(
            title: recipe.isFavourite
                ? "Remove From Favorites"
                : "Add To Favorites",
            onPressed: () => ref
                .read(recipesCtrlPvdr)
                .onFavouriteButtonPressed(recipe)
                .then(
                    (updatedRecipe) => setState(() => recipe = updatedRecipe)),
            style: FilledBottonStyle.accent,
          ));
}
