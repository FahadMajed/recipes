import 'package:flutter/material.dart';
import '../../ui.dart';

class FeatureRow extends StatelessWidget {
  final IconData iconData;

  final String title;

  final String desc;

  const FeatureRow(
    this.iconData,
    this.title,
    this.desc, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(
          flex: 1,
        ),
        Icon(
          iconData,
          size: 30,
        ),
        const Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: descMedBold,
              ),
              Text(
                desc,
                style: descMed,
              ),
            ],
          ),
        )
      ],
    );
  }
}
