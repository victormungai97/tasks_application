// lib/screens/screens.dart

import 'dart:async';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/common/common.dart';
import 'package:task_list_app/extensions/extensions.dart';
import 'package:task_list_app/locations/locations.dart';
import 'package:task_list_app/providers/providers.dart';
import 'package:task_list_app/widgets/widgets.dart';

/* Base widgets depending on the type of device based on screen width */

part 'devices/desktop.dart';
part 'devices/mobile.dart';
part 'devices/tablet.dart';

/// List of ``[BeamerDelegate]``s whose children will be rendered dependent
/// on navigation status of the application

final children = routerDelegates
    .sublist(1)
    .map((e) => Beamer(key: ValueKey(e), routerDelegate: e))
    .toList();

/// Base widget for the various pages

class Screen extends ConsumerStatefulWidget {
  /// Constructor for ``[Screen]``
  const Screen({super.key, this.child});

  /// Creates a widget that variably renders depending on screen width

  final Widget? child;
  @override
  ConsumerState<Screen> createState() => _ScreenState();
}

class _ScreenState extends ConsumerState<Screen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final uriString = Beamer.of(context).configuration.location!;
    Timer(const Duration(milliseconds: 123), () {
      late int pageIndex;

      if (uriString.contains('tasks') || uriString.contains('home')) {
        pageIndex = 0;
      } else if (uriString.contains('projects')) {
        pageIndex = 1;
      } else if (uriString.contains('teams')) {
        pageIndex = 2;
      } else {
        pageIndex = -1;
      }
      ref.read(pageIndexProvider.notifier).state = pageIndex;
      routerDelegates[ref.read(pageIndexProvider) + 1].update(
        rebuild: false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const ScreenTypeLayout(
      desktop: Desktop(),
      mobile: Mobile(),
      tablet: Tablet(),
    );
  }
}
