import 'dart:math';

import 'package:flutter/material.dart';

class ColorGenerator {
  static int getRandomColor() {
    Color c;
    var rng = Random();
    int number = rng.nextInt(6) + 1;
    switch (number) {
      case 1:
        {
          c = const Color.fromRGBO(250, 188, 131, 1);
        }
        break;
      case 2:
        {
          c = const Color.fromRGBO(213, 215, 221, 1);
        }
        break;
      case 3:
        {
          c = const Color.fromRGBO(223, 244, 245, 1);
        }
        break;

      case 4:
        {
          c = const Color.fromRGBO(27, 79, 159, 0.51);
        }
        break;

      case 5:
        {
          c = const Color.fromRGBO(97, 199, 205, 0.72);
        }
        break;

      case 6:
        {
          c = const Color.fromRGBO(47, 128, 237, 0.6);
        }
        break;
      case 7:
        {
          c = Colors.grey[500]!;
        }
        break;
      case 8:
        {
          c = Colors.pink[300]!;
        }
        break;

      default:
        {
          c = Colors.lightBlue;
        }
        break;
    }
    return c.value;
  }
}
