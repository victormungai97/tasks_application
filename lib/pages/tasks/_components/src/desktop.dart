// lib/pages/tasks/_components/src/desktop.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:task_list_app/model/model.dart';
import 'package:task_list_app/service/service.dart';

final _dateFormat = DateFormat('dd/MM, H:mm');

/// Tasks UI screen on large width devices

class TasksDesktopScreen extends HookWidget {
  /// Constructor for ``[TasksDesktopScreen]``
  const TasksDesktopScreen({super.key, this.tasks = const []});

  /// Tasks to be rendered
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: tasks.isNotEmpty
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(child: _TasksSection(tasks: tasks)),
                const VerticalDivider(thickness: 2),
                Expanded(child: _TaskSection(task: tasks.first)),
              ],
            )
          : const Center(child: Text('Tasks')),
    );
  }
}

class _TasksSection extends StatelessWidget {
  const _TasksSection({this.tasks = const []});

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(left: 28),
            child: const Text(
              'Tasks',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.blueGrey.shade200,
          endIndent: 16,
          indent: 17,
          thickness: 1.5,
        ),
        Expanded(
          flex: 17,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 40),
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(right: 15, left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: tasks.map(
                  (element) {
                    final dt = element.dateTime ?? DateTime.now();
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        tileColor: Colors.grey.shade300,
                        title: Text("Task ${element.id ?? ''}"),
                        trailing: Text(
                          _dateFormat.format(dt),
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TaskSection extends StatelessWidget {
  const _TaskSection({required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final dt = task.dateTime ?? DateTime.now();
    return Column(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(left: 28),
            child: Text(
              "Task ${task.id ?? ''}",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.blueGrey.shade200,
          endIndent: 17,
          indent: 16,
          thickness: 1.5,
        ),
        Expanded(
          flex: 17,
          child: Container(
            margin: const EdgeInsets.only(top: 56, left: 20),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _dateFormat.format(dt),
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  task.description ?? '',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
