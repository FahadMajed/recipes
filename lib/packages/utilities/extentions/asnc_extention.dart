import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncXX on AsyncValue {
  bool get isLoading => when(
        data: (_) => false,
        error: (_, __) => false,
        loading: () => true,
      );

  bool get isRefreshing => when(
        data: (_) => false,
        error: (_, __) => false,
        loading: () => true,
      );
}
