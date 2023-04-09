import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/packages/packages.dart';

import 'landing_controller.dart';

class RecipeHavenLanding extends ConsumerWidget {
  const RecipeHavenLanding({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final viewController = ref.read(landingCtrlPvdr);

    return CustomScaffold(
      scaffoldBackgroundColor: nuteralColor,
      withAppBar: false,
      withWhiteContainer: false,
      withSafeArea: false,
      resizeToAvoidBottomInset: false,
      imageFile: "bg.png",
      alignment: CrossAxisAlignment.center,
      body: [
        const Spacer(
          flex: 4,
        ),
        const Text(
          'Recipes Haven',
          style: largeHeading,
        ),
        const Logo(),
        Text(
          'Recipes for every taste and occasion!',
          style: titleExtraLarge.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        const Spacer(
          flex: 7,
        ),
        FilledBotton(
          title: "Start",
          onPressed: viewController.onStart,
        ),
        const Spacer(
          flex: 6,
        ),
      ],
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Image.asset("assets/images/ic_twotone-ramen-dining.png"));
  }
}
