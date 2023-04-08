import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'colors.dart';

final snackBarTheme = SnackBarThemeData(
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.white,
  elevation: 3,
  contentTextStyle: const TextStyle(color: Colors.black),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
);

final inputDecorationTheme = InputDecorationTheme(
  errorStyle: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.normal),
  labelStyle: TextStyle(fontSize: 11.sp),
  hintStyle: TextStyle(fontSize: 11.sp),
  isDense: true,
);

const iconTheme = IconThemeData(color: iconsColor);

final textButtonStyle = TextButton.styleFrom(
  padding: const EdgeInsets.symmetric(horizontal: 0),
);
