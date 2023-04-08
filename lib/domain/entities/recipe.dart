class Recipe {
  final String name;
  final List<String> instructions;
  final String imageUrl;
  final int rating;
  final List<String> ingredients;
  final bool isFavourite;

  Recipe(
      {required this.name,
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
    );
  }
}
