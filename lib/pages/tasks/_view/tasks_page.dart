// lib/pages/tasks/_view/tasks_page.dart

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/extensions/extensions.dart';
import 'package:task_list_app/pages/tasks/_view/desktop/desktop.dart';
import 'package:task_list_app/pages/tasks/_view/mobile/mobile.dart';
import 'package:task_list_app/providers/providers.dart';

export 'desktop/desktop.dart';
export 'mobile/mobile.dart';

/// View for page rendering tasks to be done by user

class TasksPage extends ConsumerWidget {
  /// Constructor for ``[TasksPage]``
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch the FutureProvider and get an AsyncValue<List<Task>>
    final tasksAsync = ref.watch(tasksFutureProvider);
    // use pattern matching to map the state to the UI
    return tasksAsync.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) {
        log(
          'Problem occurred loading tasks',
          error: err,
          stackTrace: stack,
          time: DateTime.now(),
        );
        return Text('${context.localize.error}: $err');
      },
      data: (tasks) => context.isMobileView
            ? TasksMobileScreen(tasks: tasks)
            : TasksDesktopScreen(tasks: tasks),
    );
  }
}
