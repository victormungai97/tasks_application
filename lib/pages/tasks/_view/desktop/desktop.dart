// lib/pages/tasks/_view/desktop/desktop.dart

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:task_list_app/extensions/extensions.dart';
import 'package:task_list_app/locations/locations.dart';
import 'package:task_list_app/model/model.dart';
import 'package:task_list_app/providers/providers.dart';

part 'detail.dart';
part 'list.dart';

final _dateFormat = DateFormat('dd/MM, H:mm');

/// Tasks UI screen on large width devices

class TasksDesktopScreen extends HookConsumerWidget {
  /// Constructor for ``[TasksDesktopScreen]``
  const TasksDesktopScreen({super.key, this.tasks = const []});

  /// Tasks to be rendered
  final List<Task> tasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (tasks.isEmpty) {
      return Center(child: Text(context.localize.missing_tasks));
    }

    // 1. watch the task ID provider and rebuild when the value changes
    final taskID = ref.watch(taskIDProvider);

    // 2. select appropriate task based on given ID
    final detail = useState<Widget>(const SizedBox());

    if (taskID == null || taskID.isEmpty) {
      detail.value = Center(child: Text(context.localize.empty_task));
    } else if (!tasks.map((e) => e.id).contains(taskID)) {
      detail.value = Center(child: Text(context.localize.invalid_task));
    } else {
      detail.value = _DetailSection(
        task: tasks.singleWhere((e) => e.id == taskID),
      );
    }

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
                Expanded(child: detail.value),
              ],
            )
          : Center(child: Text(context.localize.tasks)),
    );
  }
}
