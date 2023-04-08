import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as flutter;
import 'package:get/get.dart';
import 'package:recipes/packages/ui/widgets/containers/cupertino_bs.dart';

class DatePicker {
  static show(
      {mode = CupertinoDatePickerMode.date,
      DateTime? minimumDate,
      DateTime? initialDateTime,
      int? maximumYear,
      required Function(DateTime) onDateTimeChanged,
      bool use24format = true}) {
    if (Platform.isIOS) {
      return showCupertinoModalPopup(
        context: Get.overlayContext!,
        builder: (context) => CupertinoBSContainer(
          child: CupertinoDatePicker(
            mode: mode,
            minimumDate: minimumDate ?? DateTime.now(),
            initialDateTime: initialDateTime ?? DateTime.now(),
            onDateTimeChanged: onDateTimeChanged,
            use24hFormat: use24format,
            maximumYear: maximumYear,
          ),
        ),
      );
    } else {
      return flutter.showDatePicker(
          context: Get.overlayContext!,
          initialDate: initialDateTime ?? DateTime.now(),
          firstDate: initialDateTime ?? DateTime.now(),
          lastDate: DateTime(DateTime.now().year + 1));
    }
  }
}
