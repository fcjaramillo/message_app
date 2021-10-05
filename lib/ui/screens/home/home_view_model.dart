import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:messages_app/core/api/model/comment_model.dart';
import 'package:messages_app/core/api/model/post_model.dart';
import 'package:messages_app/core/api/model/user_model.dart';
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
      indexTab: 0,
      titleBar: 'Posts',
      posts: <PostModel>[],
    );
  }

  void onInit() async {
    final connectivity = await (Connectivity().checkConnectivity());
    if (connectivity == ConnectivityResult.mobile || connectivity == ConnectivityResult.wifi) {
      List<PostModel> response = await locator<ApiInteractor>().getAllPosts();
      response.removeRange(20, response.length);
      response.asMap().forEach((i, post) async {
        _database.setPost(PostDb(
          userId: post.userId,
          id: post.id,
          title: post.title,
          body: post.body,
        ), i);
      });
      for(int i=0; i < response.length; i++){
        PostModel post = response[i];
        bool isRead = await _database.getPostRead(post.id);
        bool isFavorite = await _database.getPostFavorite(post.id);
        response[i] = post.rebuild((p) => p
          ..isRead = isRead,
        );
      }
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

  void onTapPost(PostModel post, int index) async {
    final connectivity = await (Connectivity().checkConnectivity());
    if (connectivity == ConnectivityResult.mobile || connectivity == ConnectivityResult.wifi) {
      List<CommentModel> comments = await locator<ApiInteractor>().getAllCommentsByPost(post.id);
      UserModel user = await locator<ApiInteractor>().getUser(post.id);
      await _database.changePostRead(post.id);
      post = post.rebuild((p) => p
        ..isRead = true,
      );
      List<PostModel> posts = status.posts;
      posts[index] = post;
      status = status.copyWith(
        posts: posts,
      );
      _route.goDetail(comments: comments, post: post, user: user);
    }
  }

  void onTapTab(int index) {
    switch(index){
      case 0:
        status = status.copyWith(indexTab: index);
        break;
      case 1:
        status = status.copyWith(indexTab: index);
        break;
    }
  }

  void deletePost(PostModel post, int index) {
    List<PostModel> posts = status.posts;
    posts.removeAt(index);
    status = status.copyWith(
      posts: posts,
    );
    _database.deletePost(post.id);
  }

}