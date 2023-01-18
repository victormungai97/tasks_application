// lib/providers/src/network_provider.dart

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/model/model.dart';
import 'package:task_list_app/service/network_service.dart';

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
