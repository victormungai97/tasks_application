// lib/common/src/app_functions.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/locations/locations.dart';
import 'package:task_list_app/providers/providers.dart';

/// Miscellaneous functions used in various part of the application

class AppFunctions {
  /// Refresh the page index state and navigation stack inside a button callback
  static Future<void> updatePage(WidgetRef ref, int newIndex) async {
    ref.read(pageIndexProvider.notifier).state = newIndex;
    await Future<dynamic>.delayed(const Duration(milliseconds: 5));
    routerDelegates[ref.read(pageIndexProvider) + 1].update(rebuild: false);
  }
}
