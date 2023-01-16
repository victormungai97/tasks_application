// lib/pages/tasks/_view/desktop/desktop.dart

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:task_list_app/model/model.dart';
import 'package:task_list_app/service/service.dart' hide Task;

part 'detail.dart';
part 'list.dart';

final _dateFormat = DateFormat('dd/MM, H:mm');

/// Tasks UI screen on large width devices

class TasksDesktopScreen extends ConsumerWidget {
  /// Constructor for ``[TasksDesktopScreen]``
  const TasksDesktopScreen({super.key, this.tasks = const []});

  /// Tasks to be rendered
  final List<Task> tasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (tasks.isEmpty) {
      return const Center(child: Text('No tasks provided'));
    }

    // 1. watch the task ID provider and rebuild when the value changes
    final taskID = ref.watch(taskServiceProvider);
    // 2. select appropriate task based on given ID
    final task = taskID != null && tasks.map((e) => e.id).contains(taskID)
        ? tasks.singleWhere((e) => e.id == taskID)
        : null;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: tasks.isNotEmpty
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: _ListSection(tasks: tasks),
                ),
                const VerticalDivider(thickness: 2),
                // 3. use the selected task
                Expanded(child: _DetailSection(task: task)),
              ],
            )
          : const Center(child: Text('Tasks')),
    );
  }
}
