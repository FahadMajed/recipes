// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:recipes/lib.dart';

class _RecipesScreen extends ViewState<RecipesScreen, AsyncValue<List<Recipe>>,
    RecipesController> {
  _RecipesScreen(super.viewModelProvider, super.viewControllerProvider);

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    subscribeToScrolling();
  }

  void subscribeToScrolling() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        viewController.callGetRecipes(isRefreshing: true);
      }
    });
  }

  @override
  Widget buildView() {
    final recipes = viewModel;
    final searchedRecipes = ref.watch(searchedRecipesPvdr);
    final isRefreshing = ref.watch(isRefreshingPvdr);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recipes",
          style: titleExtraLargeBold,
        ),
        sizedHeight8,
        SearchBar(
          controller: viewController.searchCtrl,
          onSearchTermChanged: viewController.onSearchTermChanged,
        ),
        sizedHeight16,
        Expanded(
          child: RefreshIndicator(
            backgroundColor: secondayColor,
            onRefresh: () async {
              //viewController.callGetRecipes
            },
            child: ListView(
              shrinkWrap: true,
              controller: scrollController,
              children: [
                if (viewController.hasSearched) ...[
                  if (searchedRecipes.isEmpty)
                    const Text('No Recipes Found')
                  else ...[
                    for (final recipe in searchedRecipes)
                      RecipeCard(recipe: recipe),
                  ]
                ] else
                  ...recipes.when(
                    data: (recipes) => [
                      for (final recipe in recipes) RecipeCard(recipe: recipe),
                      if (isRefreshing) const Refreshing()
                    ],
                    error: (e, __) => [Text(e.toString())],
                    loading: () => [
                      const Loading(),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Refreshing extends StatelessWidget {
  const Refreshing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Loading(),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}

class RecipesScreen extends View {
  const RecipesScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RecipesScreen(
        recipesPvdr,
        recipesCtrlPvdr,
      );
}
