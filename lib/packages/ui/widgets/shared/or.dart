import 'package:flutter/material.dart';

class Or extends StatelessWidget {
  const Or({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 2,
          child: Divider(
            height: 4,
            thickness: 2,
          ),
        ),
        Expanded(
            flex: 2,
            child: Center(
                child: Text(
              'OR',
            ))),
        Expanded(
          flex: 2,
          child: Divider(
            height: 4,
            thickness: 2,
          ),
        ),
        Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
