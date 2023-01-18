// lib/widgets/src/navigation_bar/desktop_navigation_bar.dart

part of 'navigation_bar.dart';

class _DesktopNavigationBar extends ConsumerWidget {
  const _DesktopNavigationBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(pageIndexProvider);

    final navigationBarItems = _navigationBarItems(context.localize);

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
  const _NavigationBarListItem({required this.item, this.selected = false});

  final _NavigationBarItem item;

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
