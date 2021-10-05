import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:messages_app/core/api/model/post_model.dart';
import 'package:messages_app/core/api/repository/interactor/api_interactor.dart';
import 'package:messages_app/core/configure/get_it_locator.dart';
import 'package:messages_app/core/configure/message_route.dart';
import 'package:messages_app/core/data/database.dart';
import 'package:messages_app/core/data/model/post_db.dart';
import 'package:messages_app/ui/screens/home/home_status.dart';
import 'package:messages_app/viewModel.dart';

class HomeViewModel extends ViewModel<HomeStatus> {

  final MessageRoute _route;
  final Database _database;

  HomeViewModel(this._route, this._database){
    status = HomeStatus(
      isLoading: true,
      titleBar: 'Posts',
      posts: <PostModel>[],
    );
  }

  void onInit() async {
    final connectivity = await (Connectivity().checkConnectivity());
    if (connectivity == ConnectivityResult.mobile || connectivity == ConnectivityResult.wifi) {
      List<PostModel> response = await locator<ApiInteractor>().getAllPosts();
      response.removeRange(20, response.length);
      response.asMap().forEach((i, post) {
        _database.setPost(PostDb(
          userId: post.userId,
          id: post.id,
          title: post.title,
          body: post.body,
        ), i);
      });
      status = status.copyWith(posts:  response, isLoading: false);
    } else {
      List<PostDb> postsDb= await _database.getPosts();
      List<PostModel> posts = <PostModel>[];
      postsDb.forEach((postDb) {
        posts.add(PostModel( (post) => post
          ..id = postDb.id
          ..userId = postDb.userId
          ..title = postDb.title
          ..body = postDb.body
        ));
      });
      status = status.copyWith(posts: posts, isLoading: false);
      UnimplementedError();
    }
  }
}