import 'package:flutter/material.dart';
import 'package:recipes/packages/packages.dart';

class RecipeQuantities extends StatelessWidget {
  final List<String> quantities;
  const RecipeQuantities({required this.quantities, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Quantities",
          style: titleExtraLarge,
        ),
        sizedHeight8,
        for (final quantity in quantities)
          Column(
            children: [
              SelectableText("- $quantity"),
              sizedHeight4,
            ],
          ),
      ],
    );
  }
}
