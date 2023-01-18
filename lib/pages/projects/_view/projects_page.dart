// lib/pages/projects/_view/projects_page.dart

import 'package:flutter/material.dart';
import 'package:task_list_app/extensions/extensions.dart';

/// View for page rendering projects that a user is working on
class ProjectsPage extends StatelessWidget {
  /// Constructor for ``[ProjectsPage]``
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // Access the localized string
      child: Text(context.localize.projects),
    );
  }
}
