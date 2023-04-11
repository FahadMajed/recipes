import 'package:flutter/material.dart';
import '../../ui.dart';

class Loading extends StatelessWidget {
  final Color color;
  final double? value;

  const Loading({
    Key? key,
    this.color = darkBlue300,
    this.value,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: padding16,
        decoration: const BoxDecoration(
          borderRadius: radius,
        ),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color),
          value: value,
        ),
      ),
    );
  }
}
