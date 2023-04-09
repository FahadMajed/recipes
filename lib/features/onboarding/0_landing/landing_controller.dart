import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:recipes/features/onboarding/1_features/onboarding_pages_modal.dart';

import 'package:recipes/packages/utilities/base_classes/base_view_controller.dart';

class LandingController extends ViewController with PageViewController {
  LandingController(super.read) {
    page = const PageModel(
      numberOfPages: 3,
      currentPage: 0,
    );
  }

  Future<void> onStart() async {
    showModalBottomSheet(
      context: Get.overlayContext!,
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      builder: (_) => const OnBoardingPagesModal(),
    );
  }
}

final landingCtrlPvdr = Provider((ref) => LandingController(ref.read));
