import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipes/app_entry.dart';
import 'package:recipes/lib.dart';
import 'package:rest_api/dio_rest_client.dart';
import 'package:sizer/sizer.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("user");
  await Hive.openBox("favourite_recipes");

  runApp(
    Sizer(
      builder: (_, __, ___) => ProviderScope(
        overrides: [
          recipesRepoPvdr.overrideWithValue(
            TastyAPI(
              DioRESTClient(
                baseUrl: 'https://tasty.p.rapidapi.com/recipes',
                headers: {
                  'X-RapidAPI-Key': '',
                  'X-RapidAPI-Host': 'tasty.p.rapidapi.com',
                },
              ),
            ),
          ),
          favRecipesRepoPvdr
              .overrideWithValue(DefaultFavouriteRecipesRepository())
        ],
        child: const RecipeHavenEntry(),
      ),
    ),
  );
}
