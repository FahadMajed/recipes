import 'package:flutter/material.dart';
import '../../ui.dart';

class PageViewIndicator extends StatelessWidget {
  final int numOfPages;
  final int currentPage;
  const PageViewIndicator({
    Key? key,
    required this.numOfPages,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < numOfPages; i++)
            i == currentPage ? const Indicator(true) : const Indicator(false)
        ],
      );
}

class Indicator extends StatelessWidget {
  final bool isActive;

  const Indicator(
    this.isActive, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: 12.0,
      width: 12.0,
      decoration: BoxDecoration(
        color: isActive ? selectedColor : Colors.grey[400],
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
    );
  }
}
