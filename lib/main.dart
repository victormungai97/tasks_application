// lib/main.dart

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_context/riverpod_context.dart';
import 'package:task_list_app/extensions/extensions.dart';
import 'package:task_list_app/locations/locations.dart';
import 'package:task_list_app/providers/providers.dart';

void main() {
  runApp(const ProviderScope(child: InheritedConsumer(child: MyApp())));
}

/// Root widget
class MyApp extends ConsumerWidget {
  /// Constructor for ``[MyApp]``
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerDelegate = routerDelegates.first;

    return MaterialApp.router(
      restorationScopeId: 'app',
      locale: ref.watch(localeProvider),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      // Dynamically produce the app's title string, otherwise `title` is used.
      onGenerateTitle: (context) => context.localize.appTitle,
      // Controls (re)building of Navigator
      routerDelegate: routerDelegate,
      // Parses an incoming URI
      routeInformationParser: BeamerParser(),
      // Integration of Android's back button with beaming
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: routerDelegate
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
