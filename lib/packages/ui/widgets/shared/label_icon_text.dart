import 'package:flutter/material.dart';
import '../../ui.dart';

class LabelIconText extends StatelessWidget {
  final String label;
  final IconData iconData;
  final String text;

  const LabelIconText({
    Key? key,
    required this.label,
    required this.iconData,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        sizedHeight24,
        Text(
          label,
          style: titleExtraLargeBold,
          textAlign: TextAlign.center,
        ),
        sizedHeight48,
        Icon(
          iconData,
          color: darkPrimary,
          size: iconSize96,
        ),
        sizedHeight48,
        Text(
          text,
          style: descMed,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
