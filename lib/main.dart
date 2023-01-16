// lib/main.dart

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_context/riverpod_context.dart';
import 'package:task_list_app/locations/locations.dart';

void main() {
  runApp(const ProviderScope(
    child: InheritedConsumer(
      child: MyApp()
    )
  ));
}

/// Root widget
class MyApp extends StatelessWidget {
  /// Constructor for ``[MyApp]``
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routerDelegate = routerDelegates.first;

    return MaterialApp.router(
      title: 'Task list App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      // Controls (re)building of Navigator
      routerDelegate: routerDelegate,
      // Parses an incoming URI
      routeInformationParser: BeamerParser(),
      // Integration of Android's back button with beaming
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: routerDelegate,
        alwaysBeamBack: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
