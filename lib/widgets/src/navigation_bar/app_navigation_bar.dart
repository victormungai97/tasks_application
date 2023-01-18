// lib/widgets/src/navigation_bar/app_navigation_bar.dart

part of 'navigation_bar.dart';

/// Widget for navigating between the different pages of the application
class AppNavigationBar extends StatelessWidget {
  /// Constructor for ``[AppNavigationBar]``
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) => context.isMobileView
      ? const _MobileNavigationBar()
      : const _DesktopNavigationBar();
}
