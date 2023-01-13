// lib/widgets/src/screens/tablet.dart

part of 'screens.dart';

/// Base widget for large screen widths

class Tablet extends StatelessWidget {
  /// Constructor for ``[Tablet]``
  const Tablet({super.key, this.child});

  /// Creates a widget that rendered on **_tablet_** devices

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return OrientationLayout(
      landscape: Desktop(child: child),
      portrait: Mobile(child: child),
    );
  }
}
