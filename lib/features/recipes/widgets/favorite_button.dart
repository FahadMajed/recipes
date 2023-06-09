import 'package:flutter/material.dart';
import 'package:recipes/lib.dart';

class FavoriteIconButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onTap;

  const FavoriteIconButton({
    required this.onTap,
    required this.isFavorite,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        Icons.favorite,
        color: isFavorite ? darkPrimary : Colors.grey,
        size: 36,
      ),
    );
  }
}
