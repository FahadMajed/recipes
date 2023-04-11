import 'package:flutter/material.dart';
import '../../ui.dart';

class FeatureContainer extends StatelessWidget {
  final String title;
  final IconData iconData;
  final List<FeatureRow> elements;

  const FeatureContainer({
    Key? key,
    required this.iconData,
    required this.title,
    required this.elements,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: titleExtraLargeBold,
        ),
        sizedHeight16,
        Icon(
          iconData,
          size: iconSize48,
          color: iconsColor,
        ),
        sizedHeight24,
        for (final e in elements) ...[
          e,
          if (e != elements.last) sizedHeight16,
        ]
      ],
    );
  }
}
