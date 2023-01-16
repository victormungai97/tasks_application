// lib/pages/tasks/_view/mobile/mobile.dart

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:task_list_app/common/common.dart';
import 'package:task_list_app/model/model.dart';
import 'package:task_list_app/service/service.dart' hide Task;

part 'detail.dart';
part 'list.dart';

final _dateFormat = DateFormat('dd/MM, H:mm');

/// Tasks UI screen on small width devices

class TasksMobileScreen extends StatelessWidget {
  /// Constructor for ``[TasksMobileScreen]``
  const TasksMobileScreen({super.key, this.child});

  /// Widget to be contained in this screen
  final Widget? child;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: ColoredBox(
          color: AppStyle.canvasColor,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: child ?? const SizedBox(),
          ),
        ),
      );
}
