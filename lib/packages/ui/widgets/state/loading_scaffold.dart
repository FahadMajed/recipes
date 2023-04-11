import 'package:flutter/cupertino.dart';
import '../../ui.dart';

class LoadingScaffold extends StatelessWidget {
  const LoadingScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      withAppBar: false,
      title: "Loading",
      withWhiteContainer: false,
      body: const [Loading()],
    );
  }
}
