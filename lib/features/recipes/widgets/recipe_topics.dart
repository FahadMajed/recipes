import 'package:flutter/material.dart';
import 'package:recipes/lib.dart';

class RecipeTopics extends StatelessWidget {
  const RecipeTopics({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        if (recipe.topics.isEmpty)
          Chip(
            label: const Text("Nice To Try"),
            backgroundColor: primaryWithOpacity,
          ),
        for (final topic in recipe.topics)
          if (recipe.topics.indexOf(topic) < 3)
            Chip(
              label: Text(topic),
              backgroundColor: primaryWithOpacity,
            )
      ],
    );
  }
}

class RecipeIngredients extends StatelessWidget {
  const RecipeIngredients({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        for (final ingredient in recipe.ingredients)
          Chip(
            label: SelectableText(
              ingredient,
              style: subtitleMidBold,
            ),
            backgroundColor: primaryWithOpacity,
          )
      ],
    );
  }
}
