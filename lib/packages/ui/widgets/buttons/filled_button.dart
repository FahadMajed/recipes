import 'package:flutter/material.dart';
import 'package:get/get.dart';
// add icon?
import '../../ui.dart';

enum FilledBottonStyle { primary, accent }

class FilledBotton extends StatelessWidget {
  const FilledBotton({
    Key? key,
    required this.title,
    this.style = FilledBottonStyle.primary,
    this.isLoading = false,
    required this.onPressed,
  }) : super(key: key);
  final bool isLoading;
  final String title;
  final Function() onPressed;
  final FilledBottonStyle style;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: style == FilledBottonStyle.primary ? primaryColor : secondayColor,
      borderRadius: radius,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: radius,
          border: style == FilledBottonStyle.accent
              ? Border.all(
                  color: primaryColor,
                )
              : null,
        ),
        child: MaterialButton(
          onPressed: isLoading ? null : onPressed,
          minWidth: double.infinity,
          height: 55.0,
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(title.tr,
                  style: style == FilledBottonStyle.primary
                      ? filledBottonPrimary
                      : filledBottonAccent),
        ),
      ),
    );
  }
}

typedef IntegerCallback = int Function();
