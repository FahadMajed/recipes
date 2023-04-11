import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../ui.dart';

class BottomButton extends StatelessWidget {
  final Function() onPressed;
  final Function()? fallBack;
  final bool isActive;
  final String title;
  final double? height;

  const BottomButton({
    Key? key,
    required this.onPressed,
    this.fallBack,
    this.title = 'cont',
    this.height,
    this.isActive = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isActive ? darkBlue : Colors.grey,
      width: double.infinity,
      height: 10.h,
      child: TextButton(
        onPressed: isActive
            ? onPressed
            : () {
                fallBack?.call();
              },
        child: Text(
          title.tr,
          style: buttomButton,
        ),
      ),
    );
  }
}
