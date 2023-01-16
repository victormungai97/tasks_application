// lib/service/src/task_service.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ``[NotifierProvider]`` that keeps track of task that has been selected
/// via the task ID
final taskServiceProvider = NotifierProvider<Task, String?>(Task.new);

/// Exposes task ID as state that can change over time
class Task extends Notifier<String?> {
  @override
  String? build() {
    return null;
  }

  ///
  String? get update => state;

  /// Refresh the state with the latest selected task ID
  set update(String? taskID) {
    state = taskID;
  }
}
