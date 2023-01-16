// lib/navigation/navigation.dart

/*
  * Navigation (in this case nested) is implemented using the `beamer` package
  * Courtesy: https://bit.ly/3ZzUVBy
*/

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_context/riverpod_context.dart';
import 'package:task_list_app/model/model.dart';
import 'package:task_list_app/pages/pages.dart';
import 'package:task_list_app/screens/screens.dart';
import 'package:task_list_app/service/service.dart' hide Task;
import 'package:task_list_app/widgets/widgets.dart';
import 'package:url_launcher/url_launcher_string.dart';

/* Navigation is done by declaration of 1 or more `BeamLocation` subclasses. */

part 'home.dart';
part 'projects.dart';
part 'tasks.dart';
part 'teams.dart';

/// List of delegates that is used by the [Router] to build the [Navigator].
final routerDelegates = [
  /* This declares a single route that matches the ``['*']`` (universal) path
     and returns the root ``[HomePage]`` widget */
  BeamerDelegate(
    initialPath: '/home',
    transitionDelegate: const NoAnimationTransitionDelegate(),
    locationBuilder: (routeInformation, _) => HomeLocation(routeInformation),
  ),

  /* This delegate matches task paths and returns task page */
  BeamerDelegate(
    initialPath: '/tasks',
    locationBuilder: (routeInformation, _) {
      if (routeInformation.location!.contains('tasks')) {
        return TasksLocation(routeInformation);
      }
      return NotFound(path: routeInformation.location!);
    },
  ),

  /* This delegate matches projects paths and returns project page */
  BeamerDelegate(
    transitionDelegate: const ReverseTransitionDelegate(),
    locationBuilder: (routeInformation, _) {
      if (routeInformation.location!.contains('projects')) {
        return ProjectsLocation(routeInformation);
      }
      return NotFound(path: routeInformation.location!);
    },
    initialPath: '/projects',
  ),

  /* This delegate matches projects paths and returns project page */
  BeamerDelegate(
    locationBuilder: (routeInformation, _) {
      if (routeInformation.location!.contains('teams')) {
        return TeamsLocation(routeInformation);
      }
      return NotFound(path: routeInformation.location!);
    },
    initialPath: '/teams',
  ),
];
