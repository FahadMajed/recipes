import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ui.dart';

class EmptyIndicator extends StatelessWidget {
  final String message;

  const EmptyIndicator(
    this.message, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: padding8,
            child: Text(
              message.tr,
              style: titleSmall,
            ),
          ),
        ),
      ],
    );
  }
}
