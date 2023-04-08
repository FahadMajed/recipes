import 'package:flutter/material.dart';
import '../../ui.dart';

class EmptyAvatar extends StatelessWidget {
  final double iconSize;
  final Color color;

  const EmptyAvatar({
    Key? key,
    this.iconSize = 96,
    this.color = Colors.black54,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(width: 0.1, color: darkBlue700),
            borderRadius: const BorderRadius.all(Radius.circular(60))),
        child: Icon(
          Icons.person_rounded,
          size: iconSize,
          color: color,
        ),
      ),
    );
  }
}
