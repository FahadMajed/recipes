import 'package:flutter/material.dart';

class Feature {
  final String label;
  final IconData iconData;
  final String desc;
  Feature({
    required this.label,
    required this.iconData,
    required this.desc,
  });
}

final findRecipes = Feature(
    label: "Find Recipes",
    iconData: Icons.restaurant,
    desc:
        "Discover gendless culinary possibilities with Recipe Haven's extensive collection of recipes!");
final favouriteRecipe = Feature(
    label: "Favorite Recipe",
    iconData: Icons.favorite,
    desc:
        "Never lose track of your favorite recipes again! Save your go-to dishes that's always at your fingertips.");
final makeTheRecipe = Feature(
    label: "Make The Recipe",
    iconData: Icons.blender,
    desc:
        "Cook like a pro with Recipe Haven's detailed recipes and easy-to-follow instructions!");

final features = [findRecipes, favouriteRecipe, makeTheRecipe];
