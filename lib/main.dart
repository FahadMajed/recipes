import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipes/app_entry.dart';
import 'package:sizer/sizer.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("user");
  await Hive.openBox("favourite_recipes");

  runApp(
    Sizer(
      builder: (_, __, ___) => const ProviderScope(
        overrides: [],
        child: RecipeHavenEntry(),
      ),
    ),
  );
}
