import 'package:flutter/material.dart';

extension PageControllerX on PageController {
  void showNextPage() {
    nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  int get currentPage => page?.toInt() ?? 0;
}
