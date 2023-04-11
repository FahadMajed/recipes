import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ui.dart';

class Heading extends StatelessWidget {
  final String h4;
  final String h5;

  final String h6;

  final bool hasDivider;

  const Heading({
    Key? key,
    required this.h5,
    required this.h6,
    this.hasDivider = true,
    this.h4 = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (h4.isNotEmpty) ...[
          Center(
            child: Text(
              h4.tr,
              style: titleLargeBold,
            ),
          ),
          sizedHeight4
        ],
        Text(
          h5.tr,
          style: titleMidBold,
        ),
        sizedHeight4,
        if (h6.isNotEmpty)
          Text(
            h6.tr,
            style: descMed,
          ),
        if (hasDivider) divider32
      ],
    );
  }
}
