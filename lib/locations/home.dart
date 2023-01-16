// lib/locations/home.dart

part of 'locations.dart';

/// Location defining the home page
class HomeLocation extends BeamLocation<BeamState> {
  /// Constructor for ``[HomeLocation]``
  HomeLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  final _repoURL = 'https://github.com/victormungai97/tasks_application';

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final mediaQuery = MediaQuery.of(context);
    final screenType = getDeviceType(mediaQuery);
    final orientation = mediaQuery.orientation;
    final isMobile = screenType == DeviceScreenType.mobile ||
        (screenType == DeviceScreenType.tablet &&
            orientation == Orientation.portrait);

    return [
      BeamPage(
        key: ValueKey('home-${DateTime.now()}'),
        title: 'Home',
        child: Center(
          child: ClipRect(
            child: Banner(
              message: 'Fork me on GitHub',
              location:
                  isMobile ? BannerLocation.topEnd : BannerLocation.topStart,
              child: Material(
                child: GestureDetector(
                  child: (context.currentBeamLocation.state as BeamState)
                          .uri
                          .path
                          .isEmpty
                      ? const Center(child: Text('Home'))
                      : const Screen(),
                  onTap: () async {
                    if (await canLaunchUrlString(_repoURL)) {
                      await launchUrlString(_repoURL);
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    ];
  }
}
