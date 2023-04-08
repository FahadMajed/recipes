import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiaIog {
  static Future show(
      {required String title,
      String desc = "",
      String okText = "OK",
      String cancelText = "Cancel",
      Function()? onOK,
      Function()? onCancel,
      bool isDestructive = false}) {
    if (Platform.isAndroid) {
      return showDialog(
        context: Get.context!,
        builder: (ctx) => AlertDialog(
          title: Text(title.tr),
          content: Text(desc.tr),
          actions: [
            if (onCancel != null)
              TextButton(
                child: Text(cancelText.tr),
                onPressed: () {
                  onCancel();
                },
              ),
            TextButton(
              child: Text(
                okText,
                style: isDestructive ? const TextStyle(color: Colors.red) : null,
              ),
              onPressed: () {
                if (onOK != null) onOK();
              },
            ),
          ],
        ),
      );
    } else {
      return showCupertinoDialog(
        context: Get.context!,
        builder: (ctx) => CupertinoAlertDialog(
          title: Text(title.tr),
          content: Text(desc.tr),
          actions: [
            if (onCancel != null)
              CupertinoDialogAction(
                child: Text(cancelText.tr),
                onPressed: () {
                  onCancel();
                },
              ),
            CupertinoDialogAction(
              child: Text(
                okText.tr,
                style: isDestructive ? const TextStyle(color: Colors.red) : null,
              ),
              onPressed: () {
                if (onOK != null) {
                  onOK();
                } else {
                  Get.close(1);
                }
              },
            ),
          ],
        ),
      );
    }
  }
}
