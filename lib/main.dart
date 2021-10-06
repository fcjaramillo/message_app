import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:messages_app/app_theme.dart';
import 'package:messages_app/core/configure/get_it_locator.dart';
import 'package:messages_app/core/configure/message_route.dart';
import 'package:messages_app/core/data/database.dart';
import 'package:messages_app/generated/l10n.dart';

void main() async {
  setUpLocator();
  await locator.allReady();
  locator<MessageRoute>();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose() {
    locator<Database>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: locator<MessageRoute>().navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Message App',
      theme: AppTheme.build(),
      localizationsDelegates: [
        I18n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateRoute: locator<MessageRoute>().onInit,
      supportedLocales: I18n.delegate.supportedLocales,
    );
  }
}

