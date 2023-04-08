import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final List<Widget> children;
  final String fileName;
  final ImageFormat format;

  const BackgroundImage({
    Key? key,
    required this.fileName,
    this.format = ImageFormat.jpeg,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/images/$fileName.${format.name}",
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomLeft,
          ),
        ),
        ...children
      ],
    );
  }
}

enum ImageFormat {
  png,
  jpeg,
  webp,
  jpg,
}
