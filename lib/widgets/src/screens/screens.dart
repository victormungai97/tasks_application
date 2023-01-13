// lib/widgets/src/screens/screens.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:task_list_app/common/common.dart';
import 'package:task_list_app/widgets/widgets.dart';

/* Base widgets depending on the type of device based on screen width */

part 'desktop.dart';
part 'mobile.dart';
part 'tablet.dart';

/// Base widget for the various pages

class Screen extends StatelessWidget {
  /// Constructor for ``[Screen]``
  const Screen({super.key, this.child});

  /// Creates a widget that variably renders depending on screen width

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(mobile: Mobile(child: child), desktop: Desktop(child: child), tablet: Tablet(child: child),);
  }
}
