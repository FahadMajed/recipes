import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/onboarding/1_features/onboarding_controller.dart';
import 'package:recipes/features/onboarding/onboarding.dart';
import 'package:recipes/lib.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import 'models/feature.dart';

final onboardingPageCtrl = PageController();

class OnBoardingPagesModal extends ConsumerWidget {
  const OnBoardingPagesModal({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final page = ref.watch(pageModelPvdr);
    final viewController = ref.watch(onboardingCtrlPvdr);

    return Container(
      color: const Color(0xff757575),
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: BottomSheetContainer(
          height: 90.h,
          showCross: false,
          children: [
            SizedBox(
              height: 60.h,
              child: PageView(
                physics: const ClampingScrollPhysics(),
                controller: onboardingPageCtrl,
                children: [
                  for (final feature in features)
                    OnboardingPage(
                      label: feature.label,
                      iconData: feature.iconData,
                      desc: feature.desc,
                      buttonTitle: page.isLastPage ? "Browse Recipes!" : "Next",
                      onPressed: viewController.onActionButtonPressed,
                    ),
                ],
              ),
            ),
            sizedHeight32,
            sizedHeight32,
            sizedHeight32,
            PageViewIndicator(
              numOfPages: page.numberOfPages,
              currentPage: page.currentPage,
            ),
          ],
        ),
      ),
    );
  }
}
