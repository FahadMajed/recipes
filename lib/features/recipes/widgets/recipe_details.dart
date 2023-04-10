import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/recipes/recipes_controller.dart';
import 'package:recipes/lib.dart';

class RecipeDetails extends ConsumerWidget {
  final Recipe recipe;

  const RecipeDetails({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recipe.name,
            style: buttomButton,
          ),
          RecipeTopics(recipe: recipe),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const RecipeRating(),
              FavoriteButton(
                onTap: () {
                  ref.read(recipesCtrlPvdr).onFavouriteButtonPressed(recipe);
                },
                isFavorite: recipe.isFavourite,
              ),
            ],
          )
        ],
      ),
    );
  }
}
