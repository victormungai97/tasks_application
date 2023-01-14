// lib/widgets/src/screens/tablet.dart

part of 'screens.dart';

/// Base widget for large screen widths

class Tablet extends StatelessWidget {
  /// Constructor for ``[Tablet]``
  const Tablet({super.key});
  @override
  Widget build(BuildContext context) {
    return const OrientationLayout(
      portrait: Mobile(),
      landscape: Desktop(),
    );
  }
}
