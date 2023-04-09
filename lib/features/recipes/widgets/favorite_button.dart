import 'package:flutter/material.dart';
import 'package:recipes/lib.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.favorite,
      color: darkPrimary,
      size: 36,
    );
  }
}
