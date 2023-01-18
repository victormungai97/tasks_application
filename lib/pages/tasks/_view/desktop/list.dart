// lib/pages/tasks/_view/desktop/list.dart

part of 'desktop.dart';

class _ListSection extends ConsumerWidget {
  const _ListSection({this.tasks = const []});

  final List<Task> tasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskID = ref.watch(taskIDProvider);

    return Column(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(left: 28),
            child: Text(
              context.localize.tasks,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.blueGrey.shade200,
          endIndent: 16,
          indent: 17,
          thickness: 1.5,
        ),
        Expanded(
          flex: 17,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 40),
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(right: 15, left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: tasks.map(
                  (element) {
                    final dt = element.dateTime ?? DateTime.now();
                    final title = element.title ??
                        '${context.localize.task} ${tasks.indexOf(element)}';

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
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
                        onTap: () {
                          context.beamToNamed('/tasks/${element.id ?? ""}');
                        },
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
