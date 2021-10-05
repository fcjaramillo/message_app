import 'package:hive/hive.dart';

part 'post_db.g.dart';

@HiveType(typeId: 0)
class PostDb {

  @HiveField(0)
  int? userId;
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? body;

  PostDb({ this.userId, this.id, this.title, this.body, });
}