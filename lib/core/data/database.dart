import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:messages_app/core/data/model/post_db.dart';

class Database {
  late Box userBox;

  Future initDb() async {
    await Hive.initFlutter();
    Hive.registerAdapter(PostDbAdapter());
  }

  close() => Hive.close();

  //Post
  Future setPost(PostDb post, int index) async {
    var box = await Hive.openBox('post');
    if (box.length > 19){
      await box.putAt(index, post);
    } else {
      await box.add(post);
    }
  }

  Future<List<PostDb>> getPosts() async {
    var box = await Hive.openBox('post');
    //list<RequestDb> lm = RequestDb();
    PostDb postDb = PostDb();
    List<PostDb> lm = [];
    for (int i = 0; i < box.length; i++) {
      postDb = box.getAt(i);
      lm.add(postDb);
    }
    return lm;
  }

  Future deleteAllPost() async {
    var box = await Hive.openBox('post');
    for (int i = 0; i < box.length; i++) {
      box.deleteAt(i);
    }
  }

  //Read
  Future changePostRead(int id) async {
    var box = await Hive.openBox('read');
    await box.add(id);
  }

  Future<bool> getPostRead(int id) async {
    var box = await Hive.openBox('read');
    int postId = 0;
    bool result = false;
    for (int i = 0; i < box.length; i++) {
      postId = box.getAt(i);
      if(postId == id){
        result = true;
      }
    }
    return result;
  }

  //favorite
  Future changePostFavorite(int id) async {
    var box = await Hive.openBox('read');
    await box.add(id);
  }

  Future<bool> getPostFavorite(int id) async {
    var box = await Hive.openBox('read');
    int postId = 0;
    bool result = false;
    for (int i = 0; i < box.length; i++) {
      postId = box.getAt(i);
      if(postId == id)
        result = true;
    }
    return result;
  }
}