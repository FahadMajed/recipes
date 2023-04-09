import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/packages/packages.dart';

import 'landing_controller.dart';

class RecipeHavenLanding extends ConsumerWidget {
  const RecipeHavenLanding({Key? key}) : super(key: key);

  @override
  Widget build(_, ref) {
    final viewController = ref.read(landingCtrlPvdr);

    return CustomScaffold(
      scaffoldBackgroundColor: nuteralColor,
      withAppBar: false,
      withWhiteContainer: false,
      withSafeArea: false,
      resizeToAvoidBottomInset: false,
      imageFile: "w1.png",
      alignment: CrossAxisAlignment.center,
      body: [
        const Spacer(
          flex: 2,
        ),
        Text(
          'ديك',
          style: reach.copyWith(color: darkPrimary),
        ),
        SizedBox(
            height: 240, child: Image.asset("assets/images/logo no bg.png")),
        const Text(
          'منبه صلاة فجر يفهمك',
          style: titleExtraLargeBold,
        ),
        const Spacer(
          flex: 2,
        ),
        FilledBotton(
          title: "ابدأ!",
          onPressed: viewController.onStart,
        ),
        const Spacer(
          flex: 6,
        ),
      ],
    );
  }
}
