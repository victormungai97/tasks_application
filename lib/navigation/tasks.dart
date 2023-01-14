// lib/navigation/tasks.dart

part of 'navigation.dart';

/// Location defining the pages for the tasks tab
class TasksLocation extends BeamLocation<BeamState> {
  /// Constructor for ``[TasksLocation]``
  TasksLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    const child = TasksPage();
    return [
      BeamPage(
        key: ValueKey('tasks-${DateTime.now()}'),
        title: 'Tasks',
        type: BeamPageType.noTransition,
        child: child,
        // child: RootScreen(label: 'Tasks', detailsPath: '/a/details'),
      ),
      if (state.uri.pathSegments.length == 2)
        BeamPage(
          key: ValueKey(
            'task-${state.uri.pathSegments.last}-${DateTime.now()}',
          ),
          title: 'Task ${state.uri.pathSegments.last}',
          child: child,
          // child: DetailsScreen(label: 'A'),
        ),
    ];
  }
}
