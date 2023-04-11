import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/lib.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

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
            sizedHeight32,
            SizedBox(
              height: 50.h,
              child: PageView(
                physics: const ClampingScrollPhysics(),
                controller: onboardingPageCtrl,
                children: [
                  for (final feature in features)
                    OnboardingPage(
                      label: feature.label,
                      iconData: feature.iconData,
                      desc: feature.desc,
                    ),
                ],
              ),
            ),
            PageViewIndicator(
              numOfPages: page.numberOfPages,
              currentPage: page.currentPage,
            ),
            sizedHeight32,
            FilledBotton(
                title: page.isLastPage ? "Browse Recipes!" : "Next",
                onPressed: viewController.onActionButtonPressed),
            sizedHeight32,
            sizedHeight32,
          ],
        ),
      ),
    );
  }
}
