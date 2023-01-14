import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/common/common.dart';
import 'package:task_list_app/service/service.dart';

class AppNavigationBar extends ConsumerWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(indexServiceProvider);
    return ColoredBox(
      color: AppStyle.navigationBgColor,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 64),
        itemCount: navigationBarItems.length,
        itemBuilder: (context, index) => ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: _NavigationBarListItem(
            item: navigationBarItems[index],
            selected: currentIndex == index,
          ),
          onTap: () => AppFunctions.updatePage(ref, index),
        ),
        separatorBuilder: (context, index) => const Divider(
          color: AppStyle.navigationDividerColor,
          height: 1,
          endIndent: 16,
          indent: 16,
        ),
      ),
    );
  }
}

class _NavigationBarListItem extends StatelessWidget {
  const _NavigationBarListItem({
    required this.item,
    this.selected = false
  });
  final NavigationBarItem item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: selected ? const Color(0xffB99443) : null,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),

      child: Text(
        item.name,
        style: const TextStyle(
          color: AppStyle.lightTextColor,
          fontSize: 18,
        ),
      ),
    );
  }
}

final navigationBarItems = [
  // TODO: labels should be in app localization file
  NavigationBarItem(
    name: 'Tasks',
    url: 'tasks',
    icon: const Icon(Icons.task_alt_sharp),
  ),
  NavigationBarItem(
    name: 'Projects',
    url: 'projects',
    icon: const Icon(Icons.work),
  ),
  NavigationBarItem(
    name: 'Teams',
    url: 'teams',
    icon: const Icon(Icons.groups),
  ),
];

class NavigationBarItem {
  final String name;
  final String url;
  final Widget icon;

  NavigationBarItem(
      {required this.name, required this.url, this.icon = const Placeholder()});
}
