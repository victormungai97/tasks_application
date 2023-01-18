// lib/screens/devices/desktop.dart

part of '../screens.dart';

/// Base widget for large screen width devices e.g. laptops and PCs.

class Desktop extends ConsumerWidget {
  /// Constructor for ``[Desktop]``
  const Desktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch the provider and rebuild when the page index changes
    final currentIndex = ref.watch(pageIndexProvider);

    final child = currentIndex < routerDelegates.length && currentIndex >= 0
        ? children.elementAt(currentIndex)
        : Center(child: Text(context.localize.page_not_found, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),);

    // watch for locales used in app
    final locales = ref.watch(localesProvider);
    final selectedLocale = ref.watch(localeProvider);

    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(child: AppNavigationBar()),
                  Consumer(builder: (context, ref, child) {
                    return Container(
                      color: AppStyle.navigationBgColor,
                      width: MediaQuery.of(context).size.width,
                      child: ExpansionTile(title: Text(context.localize.change_language, style: const TextStyle(color: AppStyle.lightTextColor,),), leading: const Icon(Icons.translate, color: Colors.white,), children: locales.map((locale) => ListTile(
                        title: Container(
                          decoration: BoxDecoration(
                            color: selectedLocale == locale ? const Color(0xffB99443) : null,
                            borderRadius: const BorderRadius.all(Radius.circular(20),),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            locale.toLanguageTag(),
                            style: const TextStyle(fontWeight: FontWeight.w700, color: AppStyle.lightTextColor,),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () => ref.read(localeProvider.notifier).changeLanguage(locale),
                      ),).toList(),),
                    );
                  },),
                ],
              ),
          ),
          Expanded(flex: 4, child: child),
        ],
      ),
      backgroundColor: AppStyle.canvasColor,
    );
  }
}
