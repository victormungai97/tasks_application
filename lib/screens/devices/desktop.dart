// lib/screens/devices/desktop.dart

part of '../screens.dart';

/// Base widget for large screen width devices e.g. laptops and PCs.

class Desktop extends ConsumerWidget {
  /// Constructor for ``[Desktop]``
  const Desktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch the provider and rebuild when the page index changes
    final currentIndex = ref.watch(indexServiceProvider);

    final child = currentIndex < routerDelegates.length && currentIndex >= 0
        ? children.elementAt(currentIndex)
        : const Center(child: Text('Not Found'));

    return Scaffold(
      body: Row(
        children: [
          const Expanded(child: AppNavigationBar()),
          Expanded(flex: 4, child: child),
        ],
      ),
      backgroundColor: AppStyle.canvasColor,
    );
  }
}
