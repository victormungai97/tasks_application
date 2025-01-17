// lib/locations/projects.dart

part of 'locations.dart';

/// Location defining the projects
class ProjectsLocation extends BeamLocation<BeamState> {
  /// Constructor for ``[ProjectsLocation]``
  ProjectsLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: ValueKey('projects-${DateTime.now()}'),
          title: context.localize.projects,
          child: const ProjectsPage(),
        )
      ];
}
