import 'package:flutter/material.dart';
import '../../ui.dart';

class LabelIconText extends StatelessWidget {
  final String label;
  final IconData iconData;
  final String text;

  final TextStyle? labelStyle;
  final double? iconSize;
  final TextStyle? descStyle;
  final SizedBox? spacing;

  const LabelIconText({
    Key? key,
    required this.label,
    required this.iconData,
    required this.text,
    this.labelStyle,
    this.iconSize,
    this.descStyle,
    this.spacing,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: labelStyle ?? titleExtraLargeBold,
          textAlign: TextAlign.center,
        ),
        spacing ?? sizedHeight48,
        Icon(
          iconData,
          color: darkPrimary,
          size: iconSize ?? iconSize96,
        ),
        spacing ?? sizedHeight48,
        Text(
          text,
          style: descStyle ?? descMedBold,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
