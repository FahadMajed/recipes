import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/packages/utilities/extentions/extentions.dart';

///NOTIFIES PRESENTERS WITH USE CASE OUTPUT TO REPRESENT
abstract class AsyncStateControIIer<T> extends StateNotifier<AsyncValue<T>> {
  AsyncStateControIIer() : super(AsyncLoading<T>());

  void emitData(T value) => state = AsyncData(value);

  void emitError(Object e) => state = AsyncError(
        e,
      );

  void emitLoading() => state = AsyncLoading<T>();
}

abstract class AsyncListStateController<T>
    extends AsyncStateControIIer<List<T>> {
  void emitAdded(T element) => state = AsyncData([...list, element]);

  void emitRemoved(T element) => state = AsyncData([...list..remove(element)]);

  void emitUpdated(int index, T element) {
    if (index >= 0) {
      state = AsyncData(list..update(index, element));
    }
  }

  @protected
  List<T> get list => (state.value ?? []);
}

abstract class ListStateController<T> extends StateNotifier<List<T>> {
  ListStateController() : super([]);

  void emitData(List<T> value) => state = value;

  void emitAdding(T element) => state = ([...list, element]);

  void emitRemoving(T element) => state = [...list..remove(element)];

  void emitRemovingAt(int index) => state = [...list..removeAt(index)];

//DO NOT CHANGE
  void emitUpdating(int index, T element) {
    if (index >= 0) {
      state = [
        ...list
          ..removeAt(index)
          ..insert(index, element)
      ];
    }
  }

  @protected
  List<T> get list => (state);
}

abstract class StateControIIer<T> extends StateNotifier<T> {
  StateControIIer(super.state);

  void emitData(T value) => state = value;
}

abstract class MapStateController<K, V> extends StateNotifier<Map<K, V>> {
  MapStateController() : super({});

  void set(Map<K, V> value) => state = value;

  void add(K key, V value) => state = {
        ...map,
        key: value,
      };

  void remove(K key) => state = {...map..remove(key)};

  void update(K key, V value) {}

  @protected
  Map<K, V> get map => state;
}
