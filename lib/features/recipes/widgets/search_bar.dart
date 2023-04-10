import 'package:flutter/material.dart';
import 'package:recipes/lib.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    required this.onSearchTermChanged,
    super.key,
  });

  final Function(String?) onSearchTermChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: CustomTextField(
        hintText: "Search",
        onChanged: onSearchTermChanged,
      ),
    );
  }
}
