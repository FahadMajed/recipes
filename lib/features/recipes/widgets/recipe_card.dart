import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/lib.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(RecipeDetailsScreen(recipe: recipe)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Container(
          constraints: const BoxConstraints(minHeight: 336, maxHeight: 410),
          decoration: BoxDecoration(
            color: secondayColor,
            borderRadius: radius,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                blurStyle: BlurStyle.normal,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RecipeImage(recipe: recipe),
              RecipeDetails(recipe: recipe),
            ],
          ),
        ),
      ),
    );
  }
}
