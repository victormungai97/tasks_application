// lib/providers/src/index_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ``[StateProvider]`` that keeps track of index of page to be rendered
final pageIndexProvider = StateProvider<int>((ref) {
  return 0;
});
