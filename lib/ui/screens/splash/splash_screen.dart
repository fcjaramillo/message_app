import 'package:flutter/material.dart';
import 'package:messages_app/core/commons/constants.dart';
import 'package:messages_app/app_theme.dart';
import 'package:messages_app/core/configure/get_it_locator.dart';
import 'package:messages_app/core/configure/message_route.dart';
import 'package:messages_app/ui/screens/splash/splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    SplashViewModel(locator<MessageRoute>()).onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: kColorBlueDark,
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.message_outlined,
                  size: 70,
                ),
                CircularProgressIndicator(
                  backgroundColor: kColorWhite,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Cargando...',
                  style: textTheme.textButtomWhite,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
