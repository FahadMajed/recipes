import 'package:recipes/domain/domain.dart';

abstract class RecipesRepostory {
  Future<List<Recipe>> getRecipesByTerm(String term);
}
