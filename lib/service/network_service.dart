// lib/service/network_service.dart

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:task_list_app/model/model.dart';

/// This class exposes methods that carry out network requests
class NetworkService {
  /// Constructor for ``[NetworkService]``
  NetworkService({required this.loc});

  /// Instance for localization
  final AppLocalizations loc;

  /// Method to make an API Call and retrieve tasks
  Future<List<Task>> getTasks() async {
    final now = DateTime.now();
    return [
      Task(
        id: '1',
        title: loc.read_emails_from_mailbox,
        dateTime: now,
        description: lorem(paragraphs: 1),
      ),
      Task(
        id: '2',
        title: loc.check_latest_news_on_flutter,
        dateTime: now,
        description: lorem(paragraphs: 4, words: 200),
      ),
      Task(
        id: '3',
        title: loc.have_a_call_with_flutter_team,
        dateTime: now,
        description: lorem(words: 140),
      ),
      Task(
        id: '4',
        title: loc.work_on_application_performance,
        dateTime: now,
        description: lorem(words: 288),
      ),
      Task(
        id: '5',
        title: loc.plan_work_for_next_week,
        dateTime: now,
        description: lorem(paragraphs: 6),
      ),
      Task(
        id: '6',
        title: loc.order_lunch,
        dateTime: now,
        description: lorem(),
      ),
      Task(
        id: '7',
        title: loc.create_an_invoice_for_last_month,
        dateTime: now,
        description: lorem(paragraphs: 5, words: 300),
      ),
    ];
  }
}
