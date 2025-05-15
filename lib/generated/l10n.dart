// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class MyLocalizations {
  MyLocalizations();

  static MyLocalizations? _current;

  static MyLocalizations get current {
    assert(
      _current != null,
      'No instance of MyLocalizations was loaded. Try to initialize the MyLocalizations delegate before accessing MyLocalizations.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<MyLocalizations> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = MyLocalizations();
      MyLocalizations._current = instance;

      return instance;
    });
  }

  static MyLocalizations of(BuildContext context) {
    final instance = MyLocalizations.maybeOf(context);
    assert(
      instance != null,
      'No instance of MyLocalizations present in the widget tree. Did you add MyLocalizations.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static MyLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations);
  }

  /// `Flutter Demo`
  String get appTitle {
    return Intl.message('Flutter Demo', name: 'appTitle', desc: '', args: []);
  }

  /// `SetState Example`
  String get example_set_state_title {
    return Intl.message(
      'SetState Example',
      name: 'example_set_state_title',
      desc: '',
      args: [],
    );
  }

  /// `You have pushed the button this many times:`
  String get example_set_state_content {
    return Intl.message(
      'You have pushed the button this many times:',
      name: 'example_set_state_content',
      desc: '',
      args: [],
    );
  }

  /// `InheritedWidget Example`
  String get example_inherited_widget_title {
    return Intl.message(
      'InheritedWidget Example',
      name: 'example_inherited_widget_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter your username:`
  String get example_inherited_widget_content {
    return Intl.message(
      'Enter your username:',
      name: 'example_inherited_widget_content',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get example_inherited_widget_title2 {
    return Intl.message(
      'Welcome',
      name: 'example_inherited_widget_title2',
      desc: '',
      args: [],
    );
  }

  /// `Hello {userName}`
  String example_inherited_widget_content2(Object userName) {
    return Intl.message(
      'Hello $userName',
      name: 'example_inherited_widget_content2',
      desc: '',
      args: [userName],
    );
  }

  /// `Notifier Example`
  String get example_notifier_title {
    return Intl.message(
      'Notifier Example',
      name: 'example_notifier_title',
      desc: '',
      args: [],
    );
  }

  /// `You have pushed the button this many times:`
  String get example_notifier_content {
    return Intl.message(
      'You have pushed the button this many times:',
      name: 'example_notifier_content',
      desc: '',
      args: [],
    );
  }

  /// `Provider Example`
  String get example_provider_title {
    return Intl.message(
      'Provider Example',
      name: 'example_provider_title',
      desc: '',
      args: [],
    );
  }

  /// `Add Bookmark`
  String get example_provider_add {
    return Intl.message(
      'Add Bookmark',
      name: 'example_provider_add',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<MyLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<MyLocalizations> load(Locale locale) => MyLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
