// lib/main.dart

import 'package:flutter/material.dart';
import 'package:task_list_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

/// Root widget
class MyApp extends StatelessWidget {
  /// Constructor for ``[MyApp]``
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task list App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
