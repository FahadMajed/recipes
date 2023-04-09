import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:recipes/features/recipes/recipes_screen.dart';
import 'package:recipes/packages/utilities/utilities.dart';

import 'onboarding_pages_modal.dart';

class OnboardingViewController extends ViewController with PageViewController {
  OnboardingViewController(super.read);

  void onActionButtonPressed() {
    if (page.isLastPage) {
      Get.to(const RecipesScreen());
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
