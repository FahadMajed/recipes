import 'package:flutter/material.dart';
import '../../../utilities/utilities.dart';
import '../../ui.dart';

//HAS DIFFERENCE FROM RESEARCHER'S!
class PickerWithDesc extends StatelessWidget {
  final String desc;
  final String pickerTitle;
  final List items;
  final Function(int) onSelectedItemChanged;
  final bool isChangeable;
  final Icon icon;

  const PickerWithDesc(
      {Key? key,
      required this.desc,
      required this.pickerTitle,
      required this.items,
      required this.onSelectedItemChanged,
      this.isChangeable = true,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconWithText(
          icon: icon,
          text: desc,
          style: IconLabelStyle.smallBold,
        ),
        sizedHeight4,
        PickerContainer(
          text: pickerTitle,
          items: items,
          onTap: onSelectedItemChanged,
          isChangeable: isChangeable,
        ),
        sizedHeight8,
      ],
    );
  }
}

class PickerContainer extends StatelessWidget {
  final String text;
  final Function(int) onTap;
  final List items;
  final bool isChangeable;

  const PickerContainer({
    Key? key,
    required this.text,
    required this.onTap,
    required this.items,
    this.isChangeable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isChangeable
          ? () => DropDownHandler.showDropDown(items: items, onChanged: onTap)
          : null,
      child: BorderedContainer(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 0,
              ),
              child: Text(
                text,
                style: titleSmall,
              ),
            ),
            isChangeable
                ? const Icon(Icons.arrow_drop_down_sharp)
                : Container(),
          ],
        ),
      ),
    );
  }
}
