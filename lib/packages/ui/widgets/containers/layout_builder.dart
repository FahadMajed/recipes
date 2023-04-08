import 'package:flutter/material.dart';

class LayoutSingleChild extends StatelessWidget {
  final List<Widget> widgets;

  const LayoutSingleChild(
    this.widgets, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          // = 30
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(mainAxisSize: MainAxisSize.max, children: widgets),
            ),
          ),
        );
      },
    );
  }
}
