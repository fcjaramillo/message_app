import 'package:get_it/get_it.dart';
import 'package:messages_app/core/api/repository/interactor/api_interactor.dart';
import 'package:messages_app/core/configure/message_route.dart';
import 'package:messages_app/core/data/database.dart';

GetIt locator = GetIt.instance;

void setUpLocator() async {

  locator.registerSingleton<MessageRoute>(MessageRoute());
  
  //interactor
  locator.registerSingleton<ApiInteractor>(ApiInteractor());


  locator.registerSingletonAsync(() async {
    final database = Database();
    await database.initDb();
    return database;
  });

}