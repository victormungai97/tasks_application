// lib/widgets/src/screens/mobile.dart

part of 'screens.dart';

/// Base widget for small screen widths

class Mobile extends HookWidget {
  /// Constructor for ``[Mobile]``
  const Mobile({super.key, this.child});

  /// Creates a widget that rendered on **_mobile_** devices

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState<int>(0);
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks',style: TextStyle(color: AppStyle.lightTextColor, ),),backgroundColor: AppStyle.navigationBgColor,centerTitle: true,),
      body: IndexedStack(
        index: currentIndex.value,
        children: [child ?? const SizedBox()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex.value,
        items: navigationBarItems
            .map(
              (item) =>
                  BottomNavigationBarItem(label: item.name, icon: item.icon),
            )
            .toList(),
        onTap: (index) {
          if (index != currentIndex.value) {
            currentIndex.value = index;
          }
        },
      ),
      backgroundColor: AppStyle.canvasColor,
    );
  }
}
