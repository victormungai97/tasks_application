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
    return [
      BeamPage(
        key: ValueKey('home-${DateTime.now()}'),
        title: context.localize.home,
        child: Center(
          child: ClipRect(
            child: Banner(
              message: context.localize.github_prompt,
              location: context.isMobileView
                  ? BannerLocation.bottomEnd
                  : BannerLocation.topStart,
              child: Material(
                child: GestureDetector(
                  child: (context.currentBeamLocation.state as BeamState)
                          .uri
                          .path
                          .isEmpty
                      ? Center(child: Text(context.localize.home))
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
