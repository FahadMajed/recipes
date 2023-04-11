import 'package:flutter_test/flutter_test.dart';
import 'package:recipes/data/repositories/tasty_recipes_repository.dart';
import 'package:rest_api/http_rest_client.dart';

void main() {
  final recipesRepo = TastyAPI(
    HttpRESTClient(
      baseUrl: 'https://tasty.p.rapidapi.com/recipes',
      headers: {
        'X-RapidAPI-Key': '',
        'X-RapidAPI-Host': 'tasty.p.rapidapi.com',
      },
    ),
  );
  test('should get recipes', () async {
    final recipes = await recipesRepo.getRecipes(0);

    assert(recipes.isNotEmpty);
  });
}
