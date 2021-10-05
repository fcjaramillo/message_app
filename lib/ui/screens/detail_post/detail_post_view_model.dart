import 'package:messages_app/core/api/model/comment_model.dart';
import 'package:messages_app/core/api/model/post_model.dart';
import 'package:messages_app/core/api/model/user_model.dart';
import 'package:messages_app/core/configure/message_route.dart';
import 'package:messages_app/core/data/database.dart';
import 'package:messages_app/ui/screens/detail_post/detail_post_status.dart';
import 'package:messages_app/viewModel.dart';

class DetailPostViewModel extends ViewModel<DetailPostStatus> {

  final MessageRoute _route;
  final Database _database;
  final List<CommentModel> _comments;
  final PostModel _post;
  final UserModel _user;

  DetailPostViewModel(this._route, this._database, this._comments, this._post, this._user){
    status = DetailPostStatus(
      comments: _comments,
      post: _post,
      user: _user,
      titleBar: 'Posts',
    );
  }

  void onTapFavorite(PostModel post) async {
    await _database.changePostFavorite(post.id);
    post = post.rebuild((p) => p
      ..isFavorite = !(p.isFavorite!),
    );
    status = status.copyWith(post: post);
  }
}