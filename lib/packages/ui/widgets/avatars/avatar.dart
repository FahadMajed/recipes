import 'package:flutter/material.dart';
import '../../ui.dart';

class Avatar extends StatelessWidget {
  final String link;
  final double dimension;
  final Color loadingColor;
  const Avatar(
      {Key? key,
      required this.link,
      this.dimension = 96,
      this.loadingColor = Colors.white})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dimension,
      height: dimension,
      child: Align(
        widthFactor: 1,
        heightFactor: 1,
        child: Padding(
          padding: const EdgeInsets.only(),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 0.5,
                color: Colors.grey[500]!,
              ),
            ),
            child: ClipOval(
              child: Image(
                image: NetworkImage(link),
                errorBuilder: (_, __, ___) => const EmptyAvatar(),
                loadingBuilder: (_, child, event) {
                  if (event == null) {
                    return child;
                  } else {
                    return Loading(
                        color: loadingColor,
                        value: event.expectedTotalBytes != null
                            ? (event.cumulativeBytesLoaded /
                                event.expectedTotalBytes!.toDouble())
                            : null);
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
