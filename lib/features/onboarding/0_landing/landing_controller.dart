import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:recipes/lib.dart';

class LandingController extends ViewController with PageViewController {
  final UserRepository userRepository = UserRepository();

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

  Future<bool> checkIfUserCreated() async {
    return userRepository.userExists();
  }
}

final isUserCreatedPvdr = StateProvider((ref) => false);

final landingCtrlPvdr = Provider((ref) => LandingController(ref.read));
