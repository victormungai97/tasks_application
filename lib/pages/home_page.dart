import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/widgets/widgets.dart';

// This class does not have to be used. It should be replaced with class
// handling navigation using Beamer package
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
// watch the provider and rebuild when the page index changes
    return (context.currentBeamLocation.state as BeamState).uri.path.isEmpty
        ? const Center(child: Text('Home'))
        : const Screen();
  }
}
