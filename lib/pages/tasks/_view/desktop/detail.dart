// lib/pages/tasks/_view/desktop/detail.dart

part of 'desktop.dart';

class _DetailSection extends StatelessWidget {
  const _DetailSection({this.task});

  final Task? task;

  @override
  Widget build(BuildContext context) {
    if (task == null) {
      return Center(child: Text(context.localize.empty_task));
    }

    final duty = task!;

    return Column(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(left: 28),
            child: Text(
              duty.title ?? context.localize.task,
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
          endIndent: 17,
          indent: 16,
          thickness: 1.5,
        ),
        Expanded(
          flex: 17,
          child: Container(
            margin: const EdgeInsets.only(top: 56, left: 20),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _dateFormat.format(duty.dateTime ?? DateTime.now()),
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  duty.description ?? '',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
