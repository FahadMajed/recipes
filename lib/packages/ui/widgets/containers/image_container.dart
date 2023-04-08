import 'package:flutter/material.dart';
import '../../ui.dart';

class AssetImageContainer extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final EdgeInsets padding;
  final Function()? onTapped;
  final bool borderless;

  const AssetImageContainer(
      {required this.image,
      Key? key,
      this.width = double.infinity,
      this.height = 240,
      this.padding = const EdgeInsets.all(5),
      this.onTapped,
      this.borderless = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Padding(
        padding: padding,
        child: Container(
          decoration: BoxDecoration(
            border: borderless ? null : Border.all(width: 0.3),
            borderRadius: radius,
          ),
          child: ClipRRect(
            borderRadius: radius,
            child: Image.asset(
              'assets/images/$image',
              fit: BoxFit.fill,
              width: width,
              height: height,
            ),
          ),
        ),
      ),
    );
  }
}
