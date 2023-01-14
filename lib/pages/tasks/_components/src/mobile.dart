// lib/pages/tasks/_components/src/mobile.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_list_app/model/model.dart';

final _dateFormat = DateFormat('dd/MM, H:mm');

/// Tasks UI screen on large width devices

class TasksMobileScreen extends StatelessWidget {
  /// Constructor for ``[TasksMobileScreen]``
  const TasksMobileScreen({super.key, this.tasks = const []});

  /// Tasks to be rendered
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return const Center(child: Text('Tasks'));
    }

    return SafeArea(
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SizedBox(child: _TasksSection(tasks: tasks)),
      ),
    );
  }
}

class _TasksSection extends StatelessWidget {
  const _TasksSection({this.tasks = const []});

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 80,
          alignment: Alignment.bottomLeft,
          margin: const EdgeInsets.only(left: 28, bottom: 2.5),
          child: Row(
            children: const [
              Expanded(
                flex: 7,
                child: Text(
                  'Tasks',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.blueGrey.shade200,
          endIndent: 17,
          indent: 16,
          thickness: 1.5,
        ),
        const SizedBox(height: 20),
        ...tasks.map(
          (element) {
            final dt = element.dateTime ?? DateTime.now();
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
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
                onTap: () {
                  // TODO Navigate to self contained task screen
                  showDialog<dynamic>(
                    context: context,
                    builder: (_) => Dialog(
                      child: _TaskSection(task: element),
                    ),
                  );
                },
              ),
            );
          },
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 80,
          alignment: Alignment.bottomLeft,
          margin: const EdgeInsets.only(left: 28, bottom: 2.5),
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: Text(
                  "Task ${task.id ?? ''}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.blueGrey.shade200,
          endIndent: 17,
          indent: 16,
          thickness: 1.5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 10,
          ),
          child: Text(
            _dateFormat.format(dt),
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 14,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            task.description ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 17,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
