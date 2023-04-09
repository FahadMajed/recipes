import 'package:flutter/material.dart';
import 'package:recipes/lib.dart';

class OnboardingPage extends StatelessWidget {
  final IconData iconData;
  final String label;
  final String desc;
  final Widget? widget;

  const OnboardingPage({
    super.key,
    required this.iconData,
    required this.label,
    required this.desc,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelIconText(
          iconData: iconData,
          label: label,
          text: desc,
        ),
        sizedHeight48,
        widget ?? Container(),
        sizedHeight32,
      ],
    );
  }
}
