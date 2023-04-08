import 'package:flutter/material.dart';
import '../../../utilities/utilities.dart';
import '../../ui.dart';

class DarkBlueContainer extends StatelessWidget {
  final List<Widget> widgets;
  final double innerPadding;
  final EdgeInsets outerPadding;

  final CrossAxisAlignment crossAxisAlignment;

  const DarkBlueContainer(
    this.widgets, {
    Key? key,
    this.innerPadding = 8,
    this.outerPadding = EdgeInsets.zero,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerPadding,
      child: Container(
        width: getDeviceWidth(context),
        decoration: const BoxDecoration(
          color: coolGrey50,
          borderRadius: radius,
        ),
        child: Padding(
          padding: EdgeInsets.all(innerPadding),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: crossAxisAlignment,
              children: widgets),
        ),
      ),
    );
  }
}

class CenteredContainer extends StatelessWidget {
  final List<Widget> widgets;

  const CenteredContainer(
    this.widgets, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getDeviceWidth(context),
      constraints: BoxConstraints(maxHeight: getDeviceHeight(context) * 0.2),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widgets),
      ),
    );
  }
}

class DarkBlueListView extends StatelessWidget {
  final List<Widget> children;
  final double innerPadding;
  final EdgeInsets outerPadding;

  final CrossAxisAlignment crossAxisAlignment;

  const DarkBlueListView({
    Key? key,
    required this.children,
    this.innerPadding = 8,
    this.outerPadding = EdgeInsets.zero,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerPadding,
      child: Container(
        width: getDeviceWidth(context),
        decoration: const BoxDecoration(
          color: coolGrey50,
          borderRadius: radius,
        ),
        child: Padding(
          padding: EdgeInsets.all(innerPadding),
          child: ListView(
            shrinkWrap: true,
            children: children,
          ),
        ),
      ),
    );
  }
}
