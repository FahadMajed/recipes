import 'package:flutter/material.dart';
import 'package:recipes/lib.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          color: secondayColor,
          borderRadius: radius,
          border: Border.all(width: 1)),
    );
  }
}
