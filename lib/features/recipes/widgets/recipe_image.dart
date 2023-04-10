import 'package:flutter/material.dart';
import 'package:recipes/lib.dart';

class RecipeImage extends StatelessWidget {
  const RecipeImage({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: recipe.name,
      child: ClipRRect(
        borderRadius: radius,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            recipe.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
