// lib/pages/tasks/_view/mobile/detail.dart

part of 'mobile.dart';

class _DetailSection extends ConsumerWidget {
  const _DetailSection({this.task});

  /// Task details to be rendered
  final Task? task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (task == null) {
      return Center(child: Text(context.localize.empty_task));
    }

    // watch the FutureProvider and get an AsyncValue<List<Task>>
    final tasksAsync = ref.watch(tasksFutureProvider);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            alignment: Alignment.bottomLeft,
            margin: const EdgeInsets.only(left: 28, bottom: 2.5),
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Text(
                    task?.title ?? context.localize.task,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    height: 56,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    child: tasksAsync.when(
                      loading: () => const CircularProgressIndicator(),
                      error: (err, stack) {
                        return Text('${context.localize.error}: $err');
                      },
                      data: (tasks) => DropdownButtonFormField<Task>(
                        hint: Text(context.localize.tasks),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blueGrey, width: 2,),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blueGrey, width: 2,),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                        ),
                        value: task,
                        onChanged: (selected) =>
                            context.beamToNamed('/tasks/${selected?.id ?? ""}',),
                        items: tasks
                            .map(
                              (e) => DropdownMenuItem<Task>(
                                value: e,
                                child: Text("${context.localize.task} ${e.id ?? ''}",),
                              ),
                            )
                            .toList(growable: false),
                      ),
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
          if (task == null)
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Center(child: Text(context.localize.empty_task)),
            )
          else ...[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 10,
              ),
              child: Text(
                _dateFormat.format(task?.dateTime ?? DateTime.now()),
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                task?.description ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ],
      );
  }
}
