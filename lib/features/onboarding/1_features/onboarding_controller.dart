import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:recipes/main.dart';
import 'package:recipes/packages/utilities/base_classes/base_view_controller.dart';
import 'package:recipes/packages/utilities/utilities.dart';

import 'onboarding_pages_modal.dart';

class OnboardingViewController extends ViewController with PageViewController {
  OnboardingViewController(super.read);

  void onActionButtonPressed() {
    if (page.isLastPage) {
      Get.to(const MyHomePage(title: ""));
    } else {
      _showNextPage();
    }
  }

  void _showNextPage() {
    incrementPage();
    onboardingPageCtrl.showNextPage();
  }
}

final onboardingCtrlPvdr =
    Provider((ref) => OnboardingViewController(ref.read));
