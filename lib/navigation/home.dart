// lib/navigation/home.dart

part of 'navigation.dart';

/// Location defining the home page
class HomeLocation extends BeamLocation<BeamState> {
  /// Constructor for ``[HomeLocation]``
  HomeLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: ValueKey('home-${DateTime.now()}'),
          title: 'Home',
          child: const HomePage(),
        )
      ];
}
