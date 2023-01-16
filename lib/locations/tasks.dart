// lib/locations/tasks.dart

part of 'locations.dart';

/// Location defining the pages for the tasks tab
class TasksLocation extends BeamLocation<BeamState> {
  /// Constructor for ``[TasksLocation]``
  TasksLocation(super.routeInformation);

  @override
  List<String> get pathPatterns => ['/tasks/:taskId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    // Retrieve task ID if any provided and set it as state in provider
    if (state.pathParameters.containsKey('taskId')) {
      Future(() => context.read(taskServiceProvider.notifier).update =
          state.pathParameters['taskId']);
    } else {
      Future(() => context.read(taskServiceProvider.notifier).update = null);
    }

    final mediaQuery = MediaQuery.of(context);
    final deviceScreenType = getDeviceType(mediaQuery);
    final orientation = mediaQuery.orientation;
    final isMobileViewed = deviceScreenType == DeviceScreenType.mobile ||
        (deviceScreenType == DeviceScreenType.tablet &&
            orientation == Orientation.portrait);

    // Tasks available
    late List<Task> tasks;

    // Get chosen task
    late Task? task;

    if (isMobileViewed) {
      // 1. watch the task providers and rebuild when the values change
      final taskID = context.watch(taskServiceProvider);
      context.watch(tasksFutureProvider).whenOrNull(
        data: (duties) {
          // 2. select appropriate task based on given ID
          task = taskID != null && duties.map((e) => e.id).contains(taskID)
              ? duties.singleWhere((e) => e.id == taskID)
              : null;
          // 3. Update available tasks
          tasks = duties;
        },
      );
    }

    return [
      BeamPage(
        key: ValueKey('tasks-${DateTime.now()}'),
        title: 'Tasks',
        type: BeamPageType.noTransition,
        child: !isMobileViewed ? const TasksPage() : ListSection(tasks: tasks),
      ),
      if (state.uri.pathSegments.length == 2)
        BeamPage(
          key: ValueKey(
            'task-${state.uri.pathSegments.last}-${DateTime.now()}',
          ),
          title: 'Task ${state.uri.pathSegments.last}',
          child: isMobileViewed ? DetailSection(task: task) : const TasksPage(),
        ),
    ];
  }
}
