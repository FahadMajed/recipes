import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../ui.dart';

class SelectableContainer extends ConsumerWidget {
  final String text;
  final Icon icon;
  final Function() onPressed;
  final bool isChosen;
  const SelectableContainer({
    Key? key,
    required this.icon,
    required this.isChosen,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    Widget whiteIcon = Icon(
      icon.icon,
      color: Colors.white,
    );

    return Expanded(
      child: Padding(
        padding: padding4,
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: radius,
            color: isChosen ? selectedColor : Colors.white,
            border: Border.all(
              color: darkBlue,
            ),
          ),
          child: TextButton(
            onPressed: onPressed,
            child: Padding(
              padding: padding8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isChosen ? whiteIcon : icon,
                  Text(
                    text,
                    style: isChosen ? selectedText : descSmallBlack,
                  ),
                  isChosen
                      ? const Icon(
                          Icons.check_outlined,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.add,
                          color: darkBlue,
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
