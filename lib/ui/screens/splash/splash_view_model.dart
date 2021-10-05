import 'package:messages_app/core/configure/message_route.dart';

class SplashViewModel {

  final MessageRoute _route;

  SplashViewModel(this._route);

  void onInit() async {
    Future.delayed(
      Duration(milliseconds: 2000),  () async {
        //return _route.goHome();
        print('init App');
      },
    );
  }
}