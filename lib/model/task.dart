import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

/// Model representing an individual task

@freezed
class Task with _$Task {
  /// Constructor for ``[Task]``
  const factory Task({
    required String? id,
    required String? title,
    required DateTime? dateTime,
    required String? description,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
