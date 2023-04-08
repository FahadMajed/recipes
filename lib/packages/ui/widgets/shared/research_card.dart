import 'package:flutter/material.dart';
import '../../ui.dart';

enum CardSize {
  extraSmall,
  small,
  med,
  large,
}

final Map<String, double> cardSizes = {
  "extraSmall": 110,
  "small": 145,
  "med": 170,
  "large": 185,
};

class ResearchCard extends StatelessWidget {
  final Function()? onResearchPress;
  final List<Widget> widgets;
  final CardSize cardSize;

  const ResearchCard({
    Key? key,
    required this.onResearchPress,
    required this.widgets,
    this.cardSize = CardSize.med,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: cardPadding,
      child: GestureDetector(
        onTap: onResearchPress,
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: cardSizes[cardSize.name]!,
              maxHeight: cardSizes[cardSize.name]!),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: radius,
              border: boxBorder,
            ),
            child: Padding(
              padding: padding12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widgets,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
