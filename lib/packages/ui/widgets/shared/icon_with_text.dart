import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ui.dart';

enum IconLabelStyle { med, small, large, medBold, smallBold, largeBold }

final Map<IconLabelStyle, TextStyle> iconLabels = {
  IconLabelStyle.med: iconLabelMid,
  IconLabelStyle.small: iconLabelSmall,
  IconLabelStyle.smallBold: iconLabelSmallBold,
};

class IconWithText extends StatelessWidget {
  final Icon icon;

  final String text;

  final Axis direction;
  final IconLabelStyle? style;

  const IconWithText({
    Key? key,
    required this.icon,
    required this.text,
    this.style,
    this.direction = Axis.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: direction,
      children: [
        icon,
        SizedBox(
          height: direction == Axis.vertical ? 4 : 0,
          width: direction == Axis.vertical ? 0 : 4,
        ),
        Text(
          text.tr,
          style: style == null ? iconLabelSmall : iconLabels[style],
        ),
      ],
    );
  }
}

class IconWithRichText extends StatelessWidget {
  final Icon icon;

  final RichText richText;

  final Axis direction;
  final TextStyle? style;

  const IconWithRichText({
    Key? key,
    required this.icon,
    required this.richText,
    this.style,
    this.direction = Axis.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: direction,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(
          height: direction == Axis.vertical ? 4 : 0,
          width: direction == Axis.vertical ? 0 : 4,
        ),
        richText,
      ],
    );
  }
}
