// lib/pages/teams/_view/teams_page.dart

import 'package:flutter/material.dart';
import 'package:task_list_app/extensions/extensions.dart';

/// View for page rendering groups that a user is part of
class TeamsPage extends StatelessWidget {
  /// Constructor for ``[TeamsPage]``
  const TeamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // Access the localized string
      child: Text(context.localize.teams),
    );
  }
}
