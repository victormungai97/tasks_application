// lib/locations/tasks.dart

part of 'locations.dart';


/// Location defining the pages for the tasks tab
class TasksLocation extends BeamLocation<BeamState> {
  /// Constructor for ``[TasksLocation]``
  TasksLocation(super.routeInformation);

  @override
  List<String> get pathPatterns => ['/tasks/*'];


  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    // Future(() => context.read(taskIDProvider.notifier).update = null);

    return [
    BeamPage(
      key: ValueKey('tasks-${DateTime.now()}'),
      title: context.localize.tasks,
      child: const TasksPage(),
    ),
  ];
  }
}


/// Location defining visibility of a single task
class TaskDetailLocation extends BeamLocation<BeamState> {
  /// Constructor for ``[TaskDetailLocation]``
  TaskDetailLocation(super.routeInformation);

  @override
  List<String> get pathPatterns => ['/tasks/:taskId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    // Retrieve task ID if any provided and set it as state in provider
    if (state.pathParameters.containsKey('taskId')) {
      Future(() => context.read(taskIDProvider.notifier).update =
      state.pathParameters['taskId'],);
    }

    return [
      BeamPage(
        key: ValueKey(
          'task-${state.uri.pathSegments.last}-${DateTime.now()}',
        ),
        title: '${context.localize.tasks} ${state.uri.pathSegments.last}',
        child: const TasksPage(),
      ),
    ];
  }
}
