import 'package:flutter/material.dart';
import 'package:messages_app/ui/screens/splash/splash_screen.dart';

class MessageRoute {

  static final MessageRoute _singleton = MessageRoute._internal();

  factory MessageRoute() {
    return _singleton;
  }

  MessageRoute._internal();

  final navigatorKey = GlobalKey<NavigatorState>();

  Route<dynamic> onInit(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => SplashPage());
  }

}