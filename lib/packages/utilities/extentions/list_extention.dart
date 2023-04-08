extension Update<T> on List<T> {
  void update(int index, T element) {
    if (index >= 0) {
      [
        ...this
          ..removeAt(index)
          ..insert(index, element)
      ];
    }
  }
}
