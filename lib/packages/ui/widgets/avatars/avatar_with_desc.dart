import 'package:flutter/material.dart';

import '../../ui.dart';

class AvatarWithDesc extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int? color;
  final Widget subtitle;

  const AvatarWithDesc({
    Key? key,
    required this.imageUrl,
    required this.title,
    this.color,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (imageUrl.isEmpty)
          LetterAvatar(
            dimension: 42,
            title: title,
            color: color ?? Colors.grey[200]!.value,
          )
        else
          Avatar(
            dimension: 42,
            link: imageUrl,
          ),
        sizedWidth8,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: descMed,
            ),
            subtitle
          ],
        ),
      ],
    );
  }
}
