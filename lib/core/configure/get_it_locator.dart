import 'package:get_it/get_it.dart';
import 'package:messages_app/core/configure/message_route.dart';

GetIt locator = GetIt.instance;

void setUpLocator() async {

  locator.registerSingleton<MessageRoute>(MessageRoute());
  
  //interactor
  /*locator.registerSingleton<ApiInteractor>(ApiInteractor());


  locator.registerSingletonAsync(() async {
    final database = Database();
    await database.initDb();
    return database;
  });

  locator.registerSingletonAsync(() async {
    await Firebase.initializeApp();
    final pushNotification = PushNotification();
    await pushNotification.initNotifications();
    return pushNotification;
  });*/


}