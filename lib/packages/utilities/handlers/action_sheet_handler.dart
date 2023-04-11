import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/packages/ui/theme/colors.dart';

class ActionSheet {
  static Future<void> show(
      {required Map<String, void Function()> actions,
      String destructiveAction = ""}) {
    return showCupertinoModalPopup<void>(
      context: Get.context!,
      builder: (ctx) => CupertinoActionSheet(
        actions: [
          for (String action in actions.keys)
            CupertinoActionSheetAction(
              onPressed: actions[action]!,
              child: Text(
                action.tr,
                style: TextStyle(
                  color: action == destructiveAction ? Colors.red : darkBlue600,
                ),
              ),
            ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Get.close(1),
          child: Text(
            "cancel".tr,
          ),
        ),
      ),
    );
  }
}
