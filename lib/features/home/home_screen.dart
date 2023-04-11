import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/lib.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDest = ref.watch(selectedDestPvdr);

    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: padding16,
            child: selectedDest == 0
                ? const RecipesScreen()
                : const FavouritesScreen()),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: secondayColor,
        shadowColor: primaryColor,
        surfaceTintColor: primaryColor,
        selectedIndex: selectedDest,
        onDestinationSelected: (index) =>
            onDestinationSelected(index, ref.read),
        destinations: const [
          NavigationDestination(
            label: "Recipes",
            icon: Icon(Icons.restaurant),
          ),
          NavigationDestination(
            label: "Favorites",
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }

  void onDestinationSelected(int value, Reader read) {
    read(selectedDestPvdr.notifier).state = value;
  }
}
