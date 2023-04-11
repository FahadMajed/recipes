import 'package:flutter/material.dart';
import '../../ui.dart';

class BorderedContainer extends StatelessWidget {
  final Widget child;

  const BorderedContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0.5),
            color: Colors.white,
            borderRadius: radius),
        child: child);
  }
}
