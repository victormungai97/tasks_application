// lib/widgets/src/screens/screens.dart

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/common/common.dart';
import 'package:task_list_app/navigation/navigation.dart';
import 'package:task_list_app/pages/pages.dart';
import 'package:task_list_app/service/service.dart';
import 'package:task_list_app/widgets/src/app_navigation_bar.dart';
import 'package:task_list_app/widgets/src/responsiveness/responsiveness.dart';

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
    return const ScreenTypeLayout(
      desktop: Desktop(),
      mobile: Mobile(),
      tablet: Tablet(),
    );
  }
}
