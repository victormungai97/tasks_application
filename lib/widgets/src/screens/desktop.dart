// lib/widgets/src/screens/desktop.dart

part of 'screens.dart';

/// Base widget for large screen width devices e.g. laptops and PCs.

class Desktop extends StatelessWidget {
  /// Constructor for ``[Desktop]``
  const Desktop({super.key, this.child});

  /// Creates a widget that rendered on **_desktop_** devices

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const AppNavigationBar(),
          Expanded(child: child ?? const SizedBox()),
        ],
      ),
      backgroundColor: AppStyle.canvasColor,
    );
  }
}
