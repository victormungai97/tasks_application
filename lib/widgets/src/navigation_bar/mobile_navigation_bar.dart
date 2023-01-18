// lib/widgets/src/navigation_bar/mobile_navigation_bar.dart

part of 'navigation_bar.dart';

class _MobileNavigationBar extends ConsumerWidget {
  const _MobileNavigationBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      currentIndex: ref.watch(pageIndexProvider),
      items: _navigationBarItems(context.localize)
          .map((i) => BottomNavigationBarItem(label: i.name, icon: i.icon))
          .toList(),
      onTap: (index) => AppFunctions.updatePage(ref, index),
    );
  }
}
