// lib/widgets/src/responsiveness/sizing_info.dart

part of 'responsiveness.dart';

/// Class having attributes uniquely identifying a device & widget's conditions.
class SizingInformation {
  /// Constructor of ``[SizingInformation]``
  const SizingInformation({
    required this.orientation,
    required this.deviceScreenType,
    required this.screenSize,
    required this.localWidgetSize,
  });

  /// Direction in which device is physically facing / directed
  final Orientation orientation;

  /// Specific device on which app is running
  final DeviceScreenType deviceScreenType;

  /// Device screen's size
  final Size screenSize;

  /// Localized size of the specified widget
  final Size localWidgetSize;

  @override
  String toString() {
    return 'Orientation:$orientation DeviceType:$deviceScreenType';
  }
}
