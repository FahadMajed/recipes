import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ui.dart';

class TextBotton extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const TextBotton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        title.tr,
        style: textButton,
      ),
    );
  }
}
