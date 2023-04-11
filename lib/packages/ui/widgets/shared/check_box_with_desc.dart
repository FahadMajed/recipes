import 'package:flutter/material.dart';
import '../../ui.dart';

class CheckBoxWithDesc extends StatelessWidget {
  final bool value;

  final String desc;

  final Function(bool?)? onChanged;

  const CheckBoxWithDesc({
    super.key,
    required this.value,
    required this.desc,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
          ),
        ),
        sizedWidth8,
        Text(desc)
      ],
    );
  }
}
