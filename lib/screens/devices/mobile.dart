// lib/screens/devices/mobile.dart

part of '../screens.dart';

/// Base widget for small screen widths

class Mobile extends HookConsumerWidget {
  /// Constructor for ``[Mobile]``
  const Mobile({super.key});

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
      appBar: AppBar(
        title: Text(
          context.localize.tasks,
          style: const TextStyle(color: AppStyle.lightTextColor),
        ),
        backgroundColor: AppStyle.navigationBgColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: IconButton(onPressed: () => showModalBottomSheet<dynamic>(
              context: context,
              builder: (context) {
                return Wrap(
                  children: locales.map((locale) => ListTile(
                    title: Container(
                      decoration: BoxDecoration(
                        color: selectedLocale == locale ? const Color(0xffB99443) : null,
                        borderRadius: const BorderRadius.all(Radius.circular(20),),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        locale.toLanguageTag(),

                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: () => ref.read(localeProvider.notifier).changeLanguage(locale),
                  ),).toList(),
                );
              },
            ), icon: const Icon(Icons.translate),),
          ),
        ],
        centerTitle: true,
      ),
      body: child,
      bottomNavigationBar: const AppNavigationBar(),
      backgroundColor: AppStyle.canvasColor,
    );
  }
}
