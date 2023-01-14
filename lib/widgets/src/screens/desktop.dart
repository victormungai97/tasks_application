// lib/widgets/src/screens/desktop.dart

part of 'screens.dart';

/// Base widget for large screen width devices e.g. laptops and PCs.

class Desktop extends ConsumerWidget {
  /// Constructor for ``[Desktop]``
  const Desktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final children = routerDelegates.sublist(1).map((e) => Beamer(key: ValueKey(e), routerDelegate: e)).toList();

    // watch the provider and rebuild when the page index changes
    final currentIndex = ref.watch(indexServiceProvider);

    return Scaffold(
      body: Row(
        children: [
          const Expanded(child: AppNavigationBar()),
          Expanded(flex: 4, child: children.elementAt(currentIndex)),
        ],
      ),
      backgroundColor: AppStyle.canvasColor,
    );
  }
}
