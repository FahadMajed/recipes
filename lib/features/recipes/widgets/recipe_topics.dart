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
        for (final topic in recipe.topics)
          Chip(
            label: Text(topic),
            backgroundColor: primaryWithOpacity,
          )
      ],
    );
  }
}
