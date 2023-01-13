// lib/widgets/src/responsiveness/src/orientation_layout.dart

part of '../responsiveness.dart';

/// Widget that provides a user interface that varying depending on the
/// direction in the device is facing / rotated

class OrientationLayout extends StatelessWidget {
  /// Constructor for ``[OrientationLayout]``
  const OrientationLayout({
    super.key,
    this.landscape,
    this.portrait,
  });

  /// Widget that is rendered when the devices is in a horizontal direction
  /// that is the longest dimension is width.
  final Widget? landscape;

  /// Widget that is rendered when the devices is in a vertical direction
  /// that is the longest dimension is height.
  final Widget? portrait;

  @override
  Widget build(BuildContext context) {
    final child = portrait ?? SizedBox.new();
    return ResponsiveLayoutBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.orientation == Orientation.landscape) {
          return landscape ?? child;
        }

        return child;
      },
    );
  }
}
