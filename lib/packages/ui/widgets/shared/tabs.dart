import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ui.dart';

class TabsBar extends StatelessWidget {
  final List<String> tabBarElements;
  final int groupValue;
  final Function(int?)? onValueChanged;
  final List<int> tabsValues;
  const TabsBar({
    Key? key,
    this.tabBarElements = const [],
    required this.groupValue,
    this.onValueChanged,
    required this.tabsValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        children: [
          const Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 4,
            child: CupertinoSlidingSegmentedControl(
              groupValue: groupValue,
              children: {
                for (int i = 0; i < tabBarElements.length; i++)
                  i: TabBarTab(tabBarElements[i], isActive: i == groupValue)
              },
              backgroundColor: CupertinoColors.tertiarySystemFill,
              thumbColor: tertiaryColor,
              onValueChanged: (newVal) {
                onValueChanged?.call(newVal as int);
                // onValueChanged?._callUseCase(newVal as int);
              },
            ),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}

class TabBarTab extends StatelessWidget {
  final String text;
  final bool isActive;

  const TabBarTab(
    this.text, {
    required this.isActive,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text.tr,
        style: TextStyle(
            color: isActive ? Colors.white : Colors.black, fontSize: 11),
      ),
    );
  }
}
