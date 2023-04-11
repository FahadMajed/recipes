import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:recipes/lib.dart';

class InstructionsController extends ViewController with PageViewController {
  InstructionsController(super.read);

  void onActionButtonPressed() {
    if (page.isLastPage) {
      Get.offAll(const HomeScreen());
    } else {
      _showNextPage();
    }
  }

  void _showNextPage() {
    incrementPage();
    instructionsPageCtrl.showNextPage();
  }
}

final instructionsCtrlPvdr =
    Provider((ref) => InstructionsController(ref.read));
