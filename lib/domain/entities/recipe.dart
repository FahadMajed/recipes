import 'dart:convert';

class Recipe {
  final String name;
  final List<String> topics;
  final List<String> instructions;
  final String imageUrl;
  final int rating;
  final List<String> ingredients;
  final List<String> quantities;
  final bool isFavourite;

  Recipe(
      {required this.name,
      this.topics = const [],
      this.quantities = const [],
      this.instructions = const [],
      this.imageUrl = "",
      this.rating = 0,
      this.isFavourite = false,
      this.ingredients = const []});

  @override
  String toString() {
    return 'Recipe(name: $name, instructions: $instructions, imageUrl: $imageUrl, rating: $rating, ingredients: $ingredients)';
  }

  Recipe toggleFavourite() => copyWith(isFavourite: !isFavourite);

  Recipe copyWith({
    String? name,
    List<String>? instructions,
    String? imageUrl,
    int? rating,
    List<String>? ingredients,
    bool? isFavourite,
  }) {
    return Recipe(
      name: name ?? this.name,
      instructions: instructions ?? this.instructions,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      ingredients: ingredients ?? this.ingredients,
      isFavourite: isFavourite ?? this.isFavourite,
      topics: topics,
      quantities: quantities,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'instructions': instructions,
      'imageUrl': imageUrl,
      'rating': rating,
      'ingredients': ingredients,
      'isFavourite': isFavourite,
      'topics': topics,
      'quantities': quantities,
    };
  }

  factory Recipe.fromMap(Map map) {
    return Recipe(
      name: map['name'] ?? '',
      topics: List<String>.from(map["topics"] ?? []),
      instructions: List<String>.from(map['instructions'] ?? []),
      imageUrl: map['imageUrl'] ?? '',
      rating: map['rating']?.toInt() ?? 0,
      ingredients: List<String>.from(map['ingredients'] ?? []),
      quantities: List<String>.from(map['quantities'] ?? []),
      isFavourite: map['isFavourite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Recipe.fromJson(String source) => Recipe.fromMap(json.decode(source));
}
