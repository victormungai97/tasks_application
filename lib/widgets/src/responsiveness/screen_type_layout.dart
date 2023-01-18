// lib/widgets/src/responsiveness/screen_type_layout.dart

part of 'responsiveness.dart';

/// Widget that provides a user interface that varying depending on the
/// width of the end user's device screen.

class ScreenTypeLayout extends StatelessWidget {
  /// Constructor for ``[ScreenTypeLayout]``
  const ScreenTypeLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  /// Widget to be rendered on hand held devices with width less than 568 px.
  /// **Required** and will be rendered in absence of alternative widgets
  final Widget mobile;

  /// Widget to be rendered on devices of width between 568 & 768 px
  final Widget? tablet;

  /// Widget to be rendered on devices with widths greater than 768 px
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      builder: (context, sizingInformation) {
        // If sizing indicates Tablet and we have a tablet widget then return
        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          if (tablet != null) {
            return tablet!;
          }
        }

        // If sizing indicates desktop and we have a desktop widget then return
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          if (desktop != null) {
            return desktop!;
          }
        }

        // Return mobile layout if nothing else is supplied
        return mobile;
      },
    );
  }
}
