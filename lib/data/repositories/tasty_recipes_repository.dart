import 'package:recipes/domain/contracts/contracts.dart';
import 'package:recipes/domain/entities/recipe.dart';
import 'package:rest_api/rest_client.dart';

class TastyAPI implements RecipesRepostory {
  final RESTClient client;

  TastyAPI(this.client);

  @override
  final Map<String, Recipe> recipes = {};

  final fetchedIndexes = [];

  @override
  Future<List<Recipe>> getRecipes(int from) async {
    if (fetchedIndexes.contains(from)) {
      return recipes.values.toList();
    } else {
      final response = await client.call(
        RESTOption.get,
        path: '/list?from=$from&size=20',
        headers: client.headers,
      );

      final results = (response["results"] as List)
        ..removeWhere((result) => result.containsKey('sections') == false);

      final List<Recipe> recipes = results.map((e) => _fromTasy(e)).toList();

      //caching
      for (final recipe in recipes) {
        this.recipes[recipe.name] = recipe;
      }
      fetchedIndexes.add(from);

      return recipes;
    }
  }

  @override
  Future<List<Recipe>> getRecipesByTerm(String term) async {
    List<Recipe> matchingRecipes = [];

    for (final key in recipes.keys) {
      if (key.toLowerCase().contains(term.toLowerCase())) {
        matchingRecipes.add(recipes[key]!);
      }
    }
    return matchingRecipes;
  }

  Recipe _fromTasy(Map data) {
    final sections = data["sections"] as List;
    final name = sections[0]["name"] ?? data["name"];
    final topicsData = data["topics"] as List;
    final topics = <String>[];

    for (final topicData in topicsData) {
      //To not get alot of topics
      // if (topicsData.indexOf(topicData) >= 3) {
      //   break;
      // }
      topics.add(topicData["name"]);
    }
    final components = sections[0]["components"] as List;

    final List<String> ingredients = [];
    final List<String> quantities = [];
    for (final component in components) {
      quantities.add(component["raw_text"]);
      ingredients.add(
          component["ingredient"]["display_plural"].replaceAll("ÀÁÂÃÄÅ", ""));
    }

    final instructionsData = data["instructions"] as List;

    final List<String> instructions = [];

    for (final instruction in instructionsData) {
      instructions.add(
          (instruction["display_text"] as String).replaceAll("ÀÁÂÃÄÅ", ""));
    }

    final rating = ((data["user_ratings"]["score"] ?? 0 * 100)).toDouble();

    return Recipe(
        name: name,
        quantities: quantities,
        ingredients: ingredients,
        instructions: instructions,
        topics: topics,
        rating: rating,
        imageUrl: data["thumbnail_url"]);
  }
}
