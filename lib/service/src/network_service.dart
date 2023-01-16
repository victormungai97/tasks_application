// lib/service/src/network_service.dart

import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/model/model.dart';

/// ``[FutureProvider]`` which retrieve an instance of ``[NetworkService]``
/// from a pre-existing ``[Provider]`` and uses said instance to run _getTasks_
/// method which then returns list of ``[Task]``s as a Future.

final tasksFutureProvider = FutureProvider.autoDispose<List<Task>>((ref) {
  // get repository from the provider below
  final networkService = ref.watch(networkServiceProvider);
  // call method that returns a Future<List<Task>>
  return networkService.getTasks();
});

/// ``[Provider]`` that globally avails an instance of ``[NetworkService]``,
/// which is unchangeable,
/// for use in other parts of the code base.
final networkServiceProvider = Provider<NetworkService>((ref) {
  return NetworkService();
});

/// This class exposes methods that carry out network requests
class NetworkService {
  /// Constructor for ``[NetworkService]``
  NetworkService();

  /// Method to make an API Call and retrieve tasks
  Future<List<Task>> getTasks() async {
    final now = DateTime.now();
    return [
      Task(
        id: '1',
        title: 'Read emails from mailbox',
        dateTime: now,
        description: lorem(paragraphs: 1),
      ),
      Task(
        id: '2',
        title: 'Check latest news on Flutter',
        dateTime: now,
        description: lorem(paragraphs: 4, words: 200),
      ),
      Task(
        id: '3',
        title: 'Have a call with Flutter team',
        dateTime: now,
        description: lorem(words: 140),
      ),
      Task(
        id: '4',
        title: 'Work on application performance',
        dateTime: now,
        description: lorem(words: 288),
      ),
      Task(
        id: '5',
        title: 'Plan work for next week',
        dateTime: now,
        description: lorem(paragraphs: 6),
      ),
      Task(
        id: '6',
        title: 'Order lunch',
        dateTime: now,
        description: lorem(),
      ),
      Task(
        id: '7',
        title: 'Create an invoice for last month',
        dateTime: now,
        description: lorem(paragraphs: 5, words: 300),
      ),
    ];
  }
}
