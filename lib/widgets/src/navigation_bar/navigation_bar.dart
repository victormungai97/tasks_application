// lib/widgets/src/navigation_bar/navigation_bar.dart

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/common/common.dart';
import 'package:task_list_app/extensions/extensions.dart';
import 'package:task_list_app/providers/providers.dart';

part 'app_navigation_bar.dart';
part 'desktop_navigation_bar.dart';
part 'mobile_navigation_bar.dart';

List<_NavigationBarItem> _navigationBarItems(AppLocalizations loc) => [
      _NavigationBarItem(
        name: loc.tasks,
        url: 'tasks',
        icon: const Icon(Icons.task_alt_sharp),
      ),
      _NavigationBarItem(
        name: loc.projects,
        url: 'projects',
        icon: const Icon(Icons.work),
      ),
      _NavigationBarItem(
        name: loc.teams,
        url: 'teams',
        icon: const Icon(Icons.groups),
      ),
    ];

class _NavigationBarItem {
  _NavigationBarItem({
    required this.name,
    required this.url,
    this.icon = const Placeholder(),
  });

  final String name;
  final String url;
  final Widget icon;
}
