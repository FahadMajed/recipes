import 'package:flutter/material.dart';
import 'package:recipes/domain/entities/recipe.dart';
import 'package:recipes/packages/packages.dart';

class RecipeIngredients extends StatelessWidget {
  const RecipeIngredients({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Ingredients",
          style: titleExtraLarge,
        ),
        Wrap(
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
        ),
      ],
    );
  }
}
