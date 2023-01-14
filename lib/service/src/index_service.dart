// lib/service/src/index_service.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ``[StateProvider]`` that keeps track of index of page to be rendered
final indexServiceProvider = StateProvider<int>((ref) {
  return 0;
});
