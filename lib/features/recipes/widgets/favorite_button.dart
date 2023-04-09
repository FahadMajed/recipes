import 'package:flutter/material.dart';
import 'package:recipes/lib.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  const FavoriteButton({
    required this.isFavorite,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.favorite,
      color: isFavorite ? darkPrimary : Colors.grey,
      size: 36,
    );
  }
}
