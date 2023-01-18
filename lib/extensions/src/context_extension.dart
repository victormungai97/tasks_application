// lib/extensions/src/context.dart

import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_list_app/widgets/widgets.dart';

/// Extension to ``[BuildContext]`` class to provide assorted functionalities

extension BuildContextExtensions on BuildContext {
  /// Simplifies access to ``[AppLocalizations]`` instance
  AppLocalizations get localize => AppLocalizations.of(this);

  /// Detect whether to show mobile or desktop widgets
  bool get isMobileView {
    final mediaQuery = MediaQuery.of(this);
    final deviceScreenType = getDeviceType(mediaQuery);
    final orientation = mediaQuery.orientation;

    return deviceScreenType == DeviceScreenType.mobile ||
        (deviceScreenType == DeviceScreenType.tablet &&
            orientation == Orientation.portrait);
  }
}
