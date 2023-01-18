// lib/pages/tasks/_view/mobile/mobile.dart

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:task_list_app/extensions/extensions.dart';
import 'package:task_list_app/model/model.dart';
import 'package:task_list_app/providers/providers.dart';

part 'detail.dart';
part 'list.dart';

final _dateFormat = DateFormat('dd/MM, H:mm');

/// Tasks UI screen on small width devices

class TasksMobileScreen extends ConsumerWidget {
  /// Constructor for ``[TasksMobileScreen]``
  const TasksMobileScreen({super.key, this.tasks = const []});

  /// Tasks to be rendered
  final List<Task> tasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (tasks.isEmpty) {
      return Center(child: Text(context.localize.missing_tasks));
    }

    final taskID = ref.watch(taskIDProvider);

    Widget child = _ListSection(tasks: tasks);

    if (taskID != null && tasks.map((e) => e.id).contains(taskID)) {
      child = _DetailSection(
        task: tasks.singleWhere((e) => e.id == taskID),
      );
    }

    return SafeArea(
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: child,
      ),
    );
  }
}
