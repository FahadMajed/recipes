import 'package:flutter/material.dart';
import 'package:recipes/lib.dart';

import 'recipe_rating.dart';
import 'recipe_topics.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
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
            children: const [
              RecipeRating(),
              FavoriteButton(),
            ],
          )
        ],
      ),
    );
  }
}
