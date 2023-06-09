import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:recipes/data/data.dart';
import 'package:recipes/packages/utilities/utilities.dart';

import '../../home/home_screen.dart';
import 'onboarding_pages_modal.dart';

class OnboardingViewController extends ViewController with PageViewController {
  final UserRepository userRepository = UserRepository();
  OnboardingViewController(super.read);

  void onActionButtonPressed() {
    if (page.isLastPage) {
      userRepository.createUser();
      Get.offAll(const HomeScreen());
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
