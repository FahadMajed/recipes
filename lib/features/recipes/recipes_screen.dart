import 'package:flutter/material.dart';
import 'package:recipes/lib.dart';

import 'widgets/recipe_card.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Recipes",
                style: titleExtraLargeBold,
              ),
              sizedHeight8,
              Container(
                height: 45,
                decoration: BoxDecoration(
                    color: secondayColor,
                    borderRadius: radius,
                    border: Border.all(width: 1)),
              ),
              sizedHeight16,
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (final recipe in recipes) RecipeCard(recipe: recipe)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
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
