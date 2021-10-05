import 'package:flutter/material.dart';
import 'package:messages_app/core/api/model/comment_model.dart';
import 'package:messages_app/core/api/model/post_model.dart';
import 'package:messages_app/core/api/model/user_model.dart';
import 'package:messages_app/ui/screens/detail_post/detail_post_screen.dart';
import 'package:messages_app/ui/screens/home/home_screen.dart';
import 'package:messages_app/ui/screens/splash/splash_screen.dart';

class MessageRoute {

  static final MessageRoute _singleton = MessageRoute._internal();

  factory MessageRoute() {
    return _singleton;
  }

  MessageRoute._internal();

  final navigatorKey = GlobalKey<NavigatorState>();

  Route<dynamic> onInit(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => SplashScreen());
  }

  void pop<T>(T result){
    navigatorKey.currentState!.pop<T>(result);
  }

  goHome(){
    return navigatorKey.currentState!.pushReplacement(
        MaterialPageRoute(builder: (_)=> HomeScreen())
    );
  }

  goDetail({
    required List<CommentModel> comments,
    required PostModel post,
    required UserModel user,
  }){
    return navigatorKey.currentState!.push(
        MaterialPageRoute(builder: (_)=> DetailPostScreen(
          comments: comments,
          post: post,
          user: user,
        ))
    );
  }

}