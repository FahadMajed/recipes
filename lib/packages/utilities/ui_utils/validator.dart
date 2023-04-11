import 'package:get/get.dart';

class Validator {
  static String? stringValidator(String? stringToValidate, String title, int minChar, int maxChar) {
    title = title.tr;
    if (stringToValidate!.isEmpty) return "$title ${"cant_be_empty".tr}";

    if (stringToValidate.length < minChar) {
      return "$title ${"must_be_at_least".tr} $minChar ${"charactersـlong".tr}";
    }

    if (stringToValidate.length > maxChar) {
      return "$title ${"mustـbeـlessـthan".tr} $maxChar ${"charactersـlong".tr}";
    }

    return null;
  }

  static String? emailValidator({String email = ""}) {
    if (email.contains('@') == false && email.contains('.') == false) {
      return 'Invalid Email';
    }
    if (email.contains('@') && email.contains('.') == false) {
      return 'Invalid Email';
    }
    if (email.contains('.')) {
      if (email.split('.')[1].isEmpty) {
        return 'Invalid Email';
      }
    }
    if (email.contains('.')) {
      if (email.split('.')[0].endsWith('@')) {
        return 'Invalid Email';
      }
    }
    return stringValidator(email, "email".tr, 0, 100);
  }

  static String? numberValidator(String? value, {int? min, int? max}) {
    try {
      final number = int.parse(value ?? "0");

      if (value!.isEmpty) return 'Please Specify The Number';
      if (min != null && number < min) {
        return "Please Enter At Least $min";
      }
      if (value.toString() == "0") return 'Be Serious';
    } catch (e) {
      return 'Please Enter A Number';
    }
    return null;
  }

  static String? isNotEmpty(String stringToValidate, String title) => stringToValidate.isEmpty
      ? "$title can't be empty"
      : stringToValidate.trim().isEmpty
          ? "$title can't be empty"
          : null;

  static bool linkValidator(String? link) => link!.contains(".") ? true : false;
}
