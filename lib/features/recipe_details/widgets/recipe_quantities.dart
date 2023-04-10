import 'package:flutter/material.dart';
import 'package:recipes/packages/packages.dart';

class RecipeQuantities extends StatelessWidget {
  final List<String> quantities;
  final List<String> updatedQunatities = [];
  RecipeQuantities({required this.quantities, super.key}) {
    for (var q in quantities) {
      updatedQunatities.add(q.replaceAll('Â', "").replaceAll("Ã	", ""));
    }
  }

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
        for (final quantity in updatedQunatities)
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
