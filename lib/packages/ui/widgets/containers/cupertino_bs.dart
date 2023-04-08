import 'package:flutter/material.dart';
import '../../../utilities/ui_utils/ui_utils.dart';
import '../../ui.dart';

class CupertinoBSContainer extends StatelessWidget {
  final Widget child;

  const CupertinoBSContainer({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getDeviceWidth(context) * 0.8,
      color: const Color(0xff737373),
      child: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            Container(
              padding: padding20,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              height: getDeviceWidth(context) * 0.6,
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
