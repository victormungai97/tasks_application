// lib/widgets/src/responsiveness/utils.dart

part of 'responsiveness.dart';

/// Identify and specify on which likely devices the user is accessing the app

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  // Retrieve the horizontal size (width) of screen to identify likely device
  final deviceWidth = mediaQuery.size.width;

  if (deviceWidth > 950) {
    return DeviceScreenType.desktop;
  }

  if (deviceWidth > 600 && deviceWidth <= 950) {
    return DeviceScreenType.tablet;
  }

  return DeviceScreenType.mobile;
}
