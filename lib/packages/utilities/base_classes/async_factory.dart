import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AsyncFactory<T> {
  final AsyncValue<T?> asyncValue;
  AsyncFactory(this.asyncValue);
  T onData(T? data);

  T onError(e, t);

  T onLoading();

  T resolve() {
    return asyncValue.when(
      data: onData,
      error: onError,
      loading: onLoading,
    );
  }
}
