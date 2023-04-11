import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Toast {
  static void success(
    String message, {
    bool pop = false,
    bool isModalOpen = false,
    int times = 1,
    Function()? toggler,
  }) {
    final ctx = isModalOpen ? Get.overlayContext! : Get.context!;
    const onSuccess = TextStyle(
        color: Color.fromARGB(255, 11, 66, 13),
        fontSize: 14,
        fontWeight: FontWeight.w500);

    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        margin: const EdgeInsets.all(16),
        backgroundColor: const Color.fromARGB(255, 168, 236, 170),
        content: Row(
          children: [
            Icon(
              Icons.check,
              color: onSuccess.color,
            ),
            Expanded(
              child: Text(
                message.tr,
                style: onSuccess,
              ),
            )
          ],
        ),
      ),
    );

    if (toggler != null) {
      toggler();
    }

    if (pop) {
      Get.close(times);
    }
  }

  static void fail(
    String message, {
    Function()? toggler,
    int times = 1,
    bool pop = false,
  }) {
    if (pop) {
      Get.close(times);
    }
    const onFail = TextStyle(
        color: Color.fromARGB(255, 75, 15, 11),
        fontSize: 14,
        fontWeight: FontWeight.w500);

    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        margin: const EdgeInsets.all(16),
        backgroundColor: const Color.fromARGB(255, 244, 134, 126),
        content: Row(
          children: [
            Icon(
              Icons.error,
              color: onFail.color,
            ),
            Expanded(
              child: Text(
                message.tr,
                style: onFail,
              ),
            )
          ],
        ),
      ),
    );
    if (toggler != null) {
      toggler();
    }
  }
}
