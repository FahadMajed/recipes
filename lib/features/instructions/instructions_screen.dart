import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/instructions/instructions_controller.dart';
import 'package:recipes/lib.dart';

final instructionsPageCtrl = PageController();

class RecipeInstructionsScreen extends ConsumerWidget {
  final Recipe recipe;

  RecipeInstructionsScreen({
    required this.recipe,
    super.key,
  }) {
    recipe.instructions.removeLast();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(pageModelPvdr);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecipeName(recipe: recipe),
            sizedHeight8,
            RecipeImage(recipe: recipe),
            sizedHeight24,
            Expanded(
              flex: 3,
              child: PageView(
                controller: instructionsPageCtrl,
                children: [
                  for (final instruction in recipe.instructions)
                    Instruction(
                      instruction: instruction,
                      index: recipe.instructions.indexOf(instruction) + 1,
                    ),
                  LabelIconText(
                      label: "You Are Done!",
                      labelStyle: titleMidBold,
                      iconData: Icons.celebration_rounded,
                      descStyle: descMed,
                      spacing: const SizedBox(
                        height: 24,
                      ),
                      text:
                          "don’t forget to share the app with friends and family if you enjoyed it :)")
                ],
              ),
            ),
            if (page.isLastPage == false)
              Expanded(
                child: PageViewIndicator(
                  numOfPages: page.numberOfPages,
                  currentPage: page.currentPage,
                ),
              ),
            Padding(
              padding: padding16,
              child: FilledBotton(
                onPressed: ref.read(instructionsCtrlPvdr).onActionButtonPressed,
                title: page.isLastPage ? "Home" : "Next",
              ),
            ),
            const Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}

class Instruction extends StatelessWidget {
  final int index;
  late final String instruction;

  Instruction({
    required String instruction,
    required this.index,
    super.key,
  }) {
    var updatedInstruction = '';
    for (var char in instruction.characters) {
      updatedInstruction += char.replaceAll('Â', "").replaceAll("Ã	", "");
    }
    this.instruction = updatedInstruction;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Step $index",
          style: titleMidBold,
        ),
        sizedHeight8,
        Padding(
            padding: padding16,
            child: SelectableText(
              instruction,
              textAlign: TextAlign.center,
            )),
      ],
    );
  }
}
