// lib/widgets/src/screens/mobile.dart

part of 'screens.dart';

/// Base widget for small screen widths

class Mobile extends HookConsumerWidget {
  /// Constructor for ``[Mobile]``
  const Mobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final children = routerDelegates
        .sublist(1)
        .map((e) => Beamer(key: ValueKey(e), routerDelegate: e))
        .toList();
    // watch the provider and rebuild when the page index changes
    final currentIndex = ref.watch(indexServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tasks',
          style: TextStyle(color: AppStyle.lightTextColor),
        ),
        backgroundColor: AppStyle.navigationBgColor,
        centerTitle: true,
      ),
      body: children.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: navigationBarItems
            .map((i) => BottomNavigationBarItem(label: i.name, icon: i.icon))
            .toList(),
        onTap: (index) => AppFunctions.updatePage(ref, index),
      ),
      backgroundColor: AppStyle.canvasColor,
    );
  }
}
