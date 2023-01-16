// lib/pages/tasks/_view/tasks_page.dart

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/pages/tasks/_view/desktop/desktop.dart';
import 'package:task_list_app/pages/tasks/_view/mobile/mobile.dart';
import 'package:task_list_app/service/service.dart';
import 'package:task_list_app/widgets/widgets.dart';

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
        return Text('Error: $err');
      },
      data: (tasks) {
        final mediaQuery = MediaQuery.of(context);
        final deviceScreenType = getDeviceType(mediaQuery);
        final orientation = mediaQuery.orientation;

        return deviceScreenType == DeviceScreenType.mobile ||
                (deviceScreenType == DeviceScreenType.tablet &&
                    orientation == Orientation.portrait)
            ? const TasksMobileScreen()
            : TasksDesktopScreen(tasks: tasks);
      },
    );
  }
}
