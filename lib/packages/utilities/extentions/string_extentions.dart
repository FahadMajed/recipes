extension StringExtenions on String {
  String capitalizeFirstLetter() =>
      "${substring(0, 1).toUpperCase()}${substring(1)}";
}
