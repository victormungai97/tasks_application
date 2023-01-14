// lib/common/src/app_functions.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/navigation/navigation.dart';
import 'package:task_list_app/service/service.dart';

/// Miscellaneous functions used in various part of the application

class AppFunctions {
  /// Refresh the page index state and navigation stack inside a button callback
  static Future<void> updatePage(WidgetRef ref, int newIndex) async {
    ref.read(indexServiceProvider.notifier).state = newIndex;
    await Future<dynamic>.delayed(const Duration(milliseconds: 5));
    routerDelegates[ref.read(indexServiceProvider) + 1].update(rebuild: false);
  }
}
