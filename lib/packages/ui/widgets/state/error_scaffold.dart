import 'package:flutter/material.dart';
import '../../ui.dart';

class ErrorScaffold extends StatelessWidget {
  const ErrorScaffold(
    this.e, {
    Key? key,
  }) : super(key: key);
  final Object e;
  @override
  Widget build(BuildContext context) {
    return ReachScaffold(
      withWhiteContainer: true,
      body: [ErrorWidget(e)],
    );
  }
}
