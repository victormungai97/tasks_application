// lib/locations/teams.dart

part of 'locations.dart';

/// Location defining the teams
class TeamsLocation extends BeamLocation<BeamState> {
  /// Constructor for ``[TeamsLocation]``
  TeamsLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: ValueKey('teams-${DateTime.now()}'),
          title: context.localize.teams,
          child: const TeamsPage(),
        )
      ];
}
