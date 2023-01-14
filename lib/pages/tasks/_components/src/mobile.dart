// lib/pages/tasks/_components/src/mobile.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:task_list_app/model/model.dart';

/// Tasks UI screen on large width devices

class TasksMobileScreen extends HookWidget {
  /// Constructor for ``[TasksMobileScreen]``
  const TasksMobileScreen({super.key, this.tasks = const []});

  /// Tasks to be rendered
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return const Center(child: Text('Tasks'));
    }

    final task = useState<Task>(tasks.last);
    final dt = task.value.dateTime ?? DateTime.now();

    return SafeArea(
      child: Scrollbar(
        thickness: 7.5,
        trackVisibility: true,
        thumbVisibility: true,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
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
                      child: Text("Task ${task.value.id ?? ''}", style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,),),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        height: 56,
                        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12,),
                        child: DropdownButtonFormField<Task>(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blueGrey, width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blueGrey, width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                            ),
                            value: task.value,
                            onChanged: (Task? newTask) {
                              if (newTask != null) task.value = newTask;
                            },
                            items: tasks.map((e) => DropdownMenuItem<Task>(value: e,child: Text("Task ${e.id ?? ''}"),),).toList(growable: false),),
                      ),
                    )
                  ],
                ),),
              Divider(
                color: Colors.blueGrey.shade200,
                endIndent: 17,
                indent: 16,
                thickness: 1.5,),

        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Text(DateFormat('dd/MM, H:mm').format(dt),
                        style: TextStyle(color: Colors.grey.shade700, fontSize: 14,),),),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(task.value.description ?? '',
                          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17,),textAlign: TextAlign.justify,),
                      ),
            ],
          ),
        ),
      ),
    );
  }
}
