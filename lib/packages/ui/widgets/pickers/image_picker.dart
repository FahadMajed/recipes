import 'dart:io';

import 'package:flutter/material.dart';
import '../../../utilities/utilities.dart';
import '../../ui.dart';

class ImagePickerContainer extends StatelessWidget {
  final DecorationType decorationType;
  final String imageUrl;

  final Future<File?> Function() onPickFromGallery;

  final Future<File?> Function() onPickFromCamera;

  const ImagePickerContainer({
    Key? key,
    required this.imageUrl,
    required this.onPickFromGallery,
    required this.onPickFromCamera,
    this.decorationType = DecorationType.register,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => ActionSheet.show(
        actions: {
          "Photo Library": onPickFromGallery,
          "Camera": onPickFromCamera,
        },
      ),
      child: Center(
        child: ClipOval(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
                maxHeight: 96, maxWidth: 96, minHeight: 94, minWidth: 94),
            child: Container(
              decoration: _getBoxDecoration(),
              child: Align(
                widthFactor: 1,
                heightFactor: 1,
                child: (imageUrl.isNotEmpty)
                    ? Avatar(
                        link: imageUrl,
                      )
                    : decorationType == DecorationType.register
                        ? const Text("pick photo")
                        : const EmptyAvatar(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _getBoxDecoration() {
    return BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.black, width: 0.5),
      gradient: decorationType == DecorationType.register
          ? _getLinearGradient()
          : null,
    );
  }

  LinearGradient _getLinearGradient() {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      tileMode: TileMode.mirror,
      colors: [Colors.white, Colors.white, selectedColor],
    );
  }
}

enum DecorationType { register, profile }
