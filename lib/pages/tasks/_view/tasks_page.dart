import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:task_list_app/model/model.dart';
import 'package:task_list_app/pages/tasks/_components/_components.dart';
import 'package:task_list_app/service/service.dart';
import 'package:task_list_app/widgets/widgets.dart';

/// View for page rendering tasks to be done by user

class TasksPage extends HookWidget {
  /// Constructor for ``[TasksPage]``
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = useState<List<Task>>([]);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (tasks.value.isEmpty) {
        tasks.value = await NetworkService().getTasks();
      }
    });
    final mediaQuery = MediaQuery.of(context);
    final deviceScreenType = getDeviceType(mediaQuery);
    return deviceScreenType == DeviceScreenType.mobile ||
            (deviceScreenType == DeviceScreenType.tablet &&
                mediaQuery.orientation == Orientation.portrait)
        ? TasksMobileScreen(tasks: tasks.value)
        : TasksDesktopScreen(tasks: tasks.value);
  }
}
