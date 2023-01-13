import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/model/task.dart';
import 'package:uuid/uuid.dart';

final networkServiceProvider = Provider<NetworkService>((ref) {
  return NetworkService();
});

class NetworkService {
  NetworkService();

  Future<List<Task>> getTasks() async {
    final now = DateTime.now();
    const uuid = Uuid();
    return [
      Task(id: uuid.v4(), title: 'Read emails from mailbox', dateTime: now, description: lorem(paragraphs: 4, words: 200),),
      Task(id: uuid.v4(), title: 'Check latest news on Flutter', dateTime: now, description: lorem(paragraphs: 1),),
      Task(id: uuid.v4(), title: 'Have a call with Flutter team', dateTime: now, description: lorem(words: 140),),
      Task(id: uuid.v4(), title: 'Work on application performance', dateTime: now, description: lorem(words: 288),),
      Task(id: uuid.v4(), title: 'Plan work for next week', dateTime: now, description: lorem(paragraphs: 3),),
      Task(id: uuid.v4(), title: 'Order lunch', dateTime: now, description: lorem(paragraphs: 5, words: 1024),),
      Task(id: uuid.v4(), title: 'Create an invoice for last month', dateTime: now, description: lorem(),),
    ];
  }
}
