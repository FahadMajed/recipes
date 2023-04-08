import 'package:flutter/material.dart';

class LetterAvatar extends StatelessWidget {
  const LetterAvatar({
    Key? key,
    required this.color,
    required this.title,
    this.dimension = 60,
  }) : super(key: key);

  final int color;
  final String title;
  final double dimension;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dimension,
      width: dimension,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0.2),
          color: Color(color),
          borderRadius: BorderRadius.circular(dimension)),
      child: Text(
        title.isEmpty ? '' : title.substring(0, 1).toUpperCase(),
        style: TextStyle(
            fontSize: dimension > 45 ? dimension - 35 : 20,
            color: Colors.black),
      ),
    );
  }
}
