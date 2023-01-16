// lib/pages/tasks/_view/mobile/list.dart

part of 'mobile.dart';

/// UI for list on mobile
class ListSection extends ConsumerWidget {
  /// Constructor for ``[ListSection]``
  const ListSection({super.key, this.tasks = const []});

  /// List of tasks to be rendered
  final List<Task> tasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskID = ref.watch(taskServiceProvider);

    return TasksMobileScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 55,
            alignment: Alignment.bottomLeft,
            margin: const EdgeInsets.only(left: 28, bottom: 2.5),
            child: Row(
              children: const [
                Expanded(
                  flex: 7,
                  child: Text(
                    'Tasks',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.blueGrey.shade200,
            endIndent: 17,
            indent: 16,
            thickness: 1.5,
          ),
          const SizedBox(height: 20),
          ...tasks.map(
            (element) {
              final dt = element.dateTime ?? DateTime.now();
              final title = element.title ?? 'Task ${tasks.indexOf(element)}';

              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  tileColor: Colors.grey.shade300,
                  title: Text(
                    title,
                    style: taskID == element.id
                        ? const TextStyle(fontWeight: FontWeight.bold)
                        : null,
                  ),
                  trailing: Text(
                    _dateFormat.format(dt),
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                  onTap: () =>
                      context.beamToNamed('/tasks/${element.id ?? ""}'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
