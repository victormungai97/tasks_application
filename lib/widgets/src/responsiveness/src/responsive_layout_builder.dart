// lib/widgets/src/responsiveness/src/responsive_layout_builder.dart

part of '../responsiveness.dart';

/// The signature of the [LayoutBuilder] builder function.
typedef ResponsiveLayoutWidgetBuilder = Widget Function(
  BuildContext context,
  SizingInformation sizingInformation,
);

/// Widget that defers its building until layout upon
/// determining of device conditions

class ResponsiveLayoutBuilder extends StatelessWidget {
  /// Constructor of ``[ResponsiveLayoutBuilder]``
  const ResponsiveLayoutBuilder({super.key, required this.builder});

  /// Function called at layout time to construct the widget tree
  /// dependent on device conditions e.g. screen size & orientation
  final ResponsiveLayoutWidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        final mediaQuery = MediaQuery.of(context);
        final sizingInformation = SizingInformation(
          deviceScreenType: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(
            boxConstraints.maxWidth,
            boxConstraints.maxHeight,
          ),
          orientation: mediaQuery.orientation,
        );
        return builder(context, sizingInformation);
      },
    );
  }
}
