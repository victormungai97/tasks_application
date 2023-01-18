// lib/providers/src/localization_provider.dart

import 'dart:developer';
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ``[Provider]`` that hold the locales used in the app
final localesProvider = Provider((ref) => AppLocalizations.supportedLocales);

/// ``[Provider]`` used to access the ``[AppLocalizations]`` object
/// for the current locale
/// It is available through out the app
/// thus allowing access to localized strings outside our widgets
final appLocalizationsProvider = Provider<AppLocalizations>((ref) {
  // initialize from the initial locale
  ref.state = lookupAppLocalizations(ui.window.locale);
  //  create an observer to update the state
  final observer = _LocaleObserver((locales) {
    ref.state = lookupAppLocalizations(ui.window.locale);
  });
  // register the observer and dispose it when no longer needed
  final binding = WidgetsBinding.instance..addObserver(observer);
  ref.onDispose(() => binding.removeObserver(observer));
  // 4. return the state
  return ref.state;
});

/// observer used to notify the caller when the locale changes
class _LocaleObserver extends WidgetsBindingObserver {
  _LocaleObserver(this._didChangeLocales);
  final void Function(List<Locale>? locales) _didChangeLocales;
  @override
  void didChangeLocales(List<Locale>? locales) {
    _didChangeLocales(locales);
  }
}

/// ``[StateNotifierProvider]`` which allows user to set the preferred locale
final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  // set preferred initial locale from supported locales
  return LocaleNotifier(ref.watch(localesProvider).last);
});

/// Expose the locale as state that can change over time
class LocaleNotifier extends StateNotifier<Locale> {
  /// Constructor for ``[LocaleNotifier]``
  LocaleNotifier(this.initial) : super(initial);

  /// Initial locale to use
  final Locale initial;

  /// Refresh the state with the latest selected
  void changeLanguage(Locale locale) {
    try {
      state = locale;
    } catch (error) {
      log('Error changing language', time: DateTime.now(), error: error);
      state = initial;
    }
  }
}
