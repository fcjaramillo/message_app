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

class I18n {
  I18n();

  static I18n? _current;

  static I18n get current {
    assert(_current != null,
        'No instance of I18n was loaded. Try to initialize the I18n delegate before accessing I18n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<I18n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = I18n();
      I18n._current = instance;

      return instance;
    });
  }

  static I18n of(BuildContext context) {
    final instance = I18n.maybeOf(context);
    assert(instance != null,
        'No instance of I18n present in the widget tree. Did you add I18n.delegate in localizationsDelegates?');
    return instance!;
  }

  static I18n? maybeOf(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  /// `ALL`
  String get sHomeAll {
    return Intl.message(
      'ALL',
      name: 'sHomeAll',
      desc: '',
      args: [],
    );
  }

  /// `FAVORITES`
  String get sHomeFavorite {
    return Intl.message(
      'FAVORITES',
      name: 'sHomeFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Delete All`
  String get sHomeDelete {
    return Intl.message(
      'Delete All',
      name: 'sHomeDelete',
      desc: '',
      args: [],
    );
  }

  /// `Description:`
  String get sDetailDescription {
    return Intl.message(
      'Description:',
      name: 'sDetailDescription',
      desc: '',
      args: [],
    );
  }

  /// `User:`
  String get sDetailUser {
    return Intl.message(
      'User:',
      name: 'sDetailUser',
      desc: '',
      args: [],
    );
  }

  /// `Name:`
  String get sDetailName {
    return Intl.message(
      'Name:',
      name: 'sDetailName',
      desc: '',
      args: [],
    );
  }

  /// `Email:`
  String get sDetailEmail {
    return Intl.message(
      'Email:',
      name: 'sDetailEmail',
      desc: '',
      args: [],
    );
  }

  /// `Phone:`
  String get sDetailPhone {
    return Intl.message(
      'Phone:',
      name: 'sDetailPhone',
      desc: '',
      args: [],
    );
  }

  /// `Website:`
  String get sDetailWebsite {
    return Intl.message(
      'Website:',
      name: 'sDetailWebsite',
      desc: '',
      args: [],
    );
  }

  /// `COMMENTS`
  String get sDetailComments {
    return Intl.message(
      'COMMENTS',
      name: 'sDetailComments',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get sSplashLoading {
    return Intl.message(
      'Loading...',
      name: 'sSplashLoading',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<I18n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<I18n> load(Locale locale) => I18n.load(locale);
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
