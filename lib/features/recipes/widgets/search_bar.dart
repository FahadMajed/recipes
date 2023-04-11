import 'package:flutter/material.dart';
import 'package:recipes/lib.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    required this.controller,
    required this.onSearchTermChanged,
    super.key,
  });
  final TextEditingController controller;
  final Function(String?) onSearchTermChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: CustomTextField(
        hintText: "Search",
        controller: controller,
        onChanged: onSearchTermChanged,
      ),
    );
  }
}
